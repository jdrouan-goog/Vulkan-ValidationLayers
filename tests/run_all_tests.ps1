Param([switch]$Debug)

if ($Debug) {
    $dPath = "Debug"
} else {
    $dPath = "Release"
}

Set-Item -path env:Path -value ($env:Path + ";..\loader\$dPath")
Set-Item -path env:Path -value ($env:Path + ";gtest-1.7.0\$dPath")

& $dPath\vkbase.exe
& $dPath\vk_blit_tests
& $dPath\vk_image_tests
& $dPath\vk_render_tests --compare-images
& $dPath\vk_layer_validation_tests

