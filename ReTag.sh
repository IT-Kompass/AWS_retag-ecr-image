AWSProfile="<<FillMe>>" #AWS CLI Profile
IsOldDigit=true         #If old image a Digest set to true, if the old container Value is a Tag set to false.
OldImage="<<FILLME>>"   # IMG Digest or Tag, depending on $IsOldDigit
NewTag="<<FILLME>>"     #What should the new tag be?
Repository="<FILLME>>"  # Repository Name in ECR

#Let's do it :)

if [ $IsOldDigit = true ]; then
    MANIFEST=$(aws ecr batch-get-image --repository-name $Repository --image-ids imageDigest=$OldImage --query 'images[].imageManifest' --output text --profile $AWSProfile)
fi
if [ $IsOldDigit = false ]; then
    MANIFEST=$(aws ecr batch-get-image --repository-name $Repository --image-ids imageTrue=$OldImage --query 'images[].imageManifest' --output text --profile $AWSProfile)
fi

aws ecr put-image --repository-name $Repository --image-tag $NewTag --image-manifest "$MANIFEST" --profile $AWSProfile
