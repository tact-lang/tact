struct HasOptional {
    a: Int?;
    b: Bool?;
}

struct ContainerOptional {
    nestedOpt: HasOptional?;
}

contract OptionalInOptional {
    f: ContainerOptional;

    init() {
        self.f = ContainerOptional{nestedOpt:null};
    }
}