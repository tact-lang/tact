struct OnlyInnerOpt {
    val: Int?;
}

struct WrapperOpt {
    inner: OnlyInnerOpt?;
}

struct ContainerOpt {
    wrap: WrapperOpt?;
}

contract TripleNestedOpt {
    data: ContainerOpt;

    init() {
        self.data = ContainerOpt{ wrap: WrapperOpt{ inner: OnlyInnerOpt{ val: null } } };
    }
}