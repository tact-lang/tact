struct FlatOpt {
    a: Int?;
    b: Int?;
    c: Int?;
}

struct ContainerOpt {
    s: FlatOpt?;
}

contract OptionOptionalField {
    co: ContainerOpt;
    init() {
        self.co = ContainerOpt{
            s: null,
        };
    }
}