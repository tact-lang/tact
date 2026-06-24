struct OptionWithin {
    a: Int?;
    b: Int?;
}

struct ContainerOpt {
    opt: OptionWithin?;
}

contract OptionalStructInStruct {
    state: ContainerOpt;
    init() {
        self.state = ContainerOpt{
            opt: null
        };
    }
}