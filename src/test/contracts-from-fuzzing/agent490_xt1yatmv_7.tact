struct OptionalNested {
    innerOpt: Int?;
    deeperOpt: Bool?;
}

struct ContainerOpt {
    nestedOpt: OptionalNested?;
    flag: Bool;
}

contract TestContract {
    data: ContainerOpt;

    init() {
        self.data = ContainerOpt{
            nestedOpt: null,
            flag: true
        };
    }
}