#' usethis::use_package("kinship2")

#' Check whether there is consanguinity among pedigrees
#'
#' @param pedigree is a pedigree of a pedigreeList format or list of pedigrees
#'

.check.consanguinity = function(pedigree){


  if(class(pedigree) == "list"){
    ped.consanguinity = c()

    for(ped in 1:length(pedigree)){
      df.ped = kinship2::as.data.frame.pedigree(pedigree[[ped]])

      couple = unique(df.ped[df.ped$dadid!=0,c("dadid","momid")])
      kinship.mat = kinship2::kinship(pedigree[[ped]])

      consanguinity.coeff = c()
      for(i in 1:nrow(couple)){
        dadid = couple$dadid[i]
        momid = couple$momid[i]

        consanguinity.coeff = c(consanguinity.coeff,kinship.mat[dadid,momid ])
      }

      ped.consanguinity = c(ped.consanguinity, any(consanguinity.coeff>0))
    }

    return(which(ped.consanguinity))
  }

  else if (class(pedigree) == "pedigreeList"){

    ped.consanguinity = c()
    famid = unique(pedigree$famid)

    for(ped in famid){
      df.ped = kinship2::as.data.frame.pedigree(pedigree[as.character(ped)])

      couple = unique(df.ped[df.ped$dadid!=0,c("dadid","momid")])
      kinship.mat = kinship2::kinship(pedigree[as.character(ped)])

      consanguinity.coeff = c()
      for(i in 1:nrow(couple)){
        dadid = as.character(couple$dadid[i])
        momid = as.character(couple$momid[i])

        consanguinity.coeff = c(consanguinity.coeff,kinship.mat[dadid,momid])
      }

      ped.consanguinity = c(ped.consanguinity, any(consanguinity.coeff>0))
    }

    return(which(ped.consanguinity))
  }

  else if(class(pedigree) == "pedigree"){

    df.ped = kinship2::as.data.frame.pedigree(pedigree)

    couple = unique(df.ped[df.ped$dadid!=0,c("dadid","momid")])
    kinship.mat = kinship2::kinship(pedigree)

    consanguinity.coeff = c()
    for(i in 1:nrow(couple)){
      dadid = as.character(couple$dadid[i])
      momid = as.character(couple$momid[i])

      consanguinity.coeff = c(consanguinity.coeff,kinship.mat[dadid,momid])
    }

    return(any(consanguinity.coeff>0))
  }


}


