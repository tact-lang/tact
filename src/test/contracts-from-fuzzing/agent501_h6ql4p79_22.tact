struct OptionalInner {
    val: Int;
}

struct ContainerOpt {
    i: OptionalInner?;
}

contract OptInnerWrapper {
    data: ContainerOpt;

    init() {
        self.data = ContainerOpt{ i: OptionalInner{ val: 42 } };
    }
}