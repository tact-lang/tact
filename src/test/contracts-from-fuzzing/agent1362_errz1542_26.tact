struct OptInOpt {
    x: Int?;
}

struct ContainerOpt {
    inner: OptInOpt?;
}

contract OptInContainerOpt {
    data: ContainerOpt = ContainerOpt{ inner: null };
}