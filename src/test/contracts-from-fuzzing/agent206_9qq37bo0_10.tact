struct InnerOpt {
    someStr: String?;
    someInt: Int?;
}

struct ContainerOpt {
    inner: InnerOpt?;
    number: Int?;
    flag: Bool?;
}

contract OptionalCascade {
    data: ContainerOpt;

    init() {
        self.data = ContainerOpt{
            inner: null,
            number: null,
            flag: null
        };
    }
}
