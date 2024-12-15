aws-retag-ecr-image


AWSProfile="<<FillMe>>" #AWS CLI Profile
IsOldDigit=true         #If old image a Digest set to true, if the old container Value is a Tag set to false.
OldImage="<<FILLME>>"   # IMG Digest or Tag, depending on $IsOldDigit
NewTag="<<FILLME>>"     #What should the new tag be?
Repository="<FILLME>>"  # Repository Name in ECR


Powershell:
https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-retag.html
