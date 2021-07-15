AWSProfile="<<FillMe>>"
IsOldDigest=true
OldImage="sha256:<<FillMe>>"
NewTag="<<FillMe>>"
Repository="<<FillMe>>"


if [ $IsOldDigest = true ]; then
    MANIFEST=$(aws ecr batch-get-image --repository-name $Repository --image-ids imageDigest=$OldImage --query 'images[].imageManifest' --output text --profile $AWSProfile)
fi
if [ $IsOldDigest = false ]; then
    MANIFEST=$(aws ecr batch-get-image --repository-name $Repository --image-ids imageTrue=$OldImage --query 'images[].imageManifest' --output text --profile $AWSProfile)
fi

aws ecr put-image --repository-name $Repository --image-tag $NewTag --image-manifest "$MANIFEST" --profile $AWSProfile