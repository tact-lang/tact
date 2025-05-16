struct DeepOptional {
    a: Int?;
    b: String?;
}

struct ContainerOpt {
    embedded: DeepOptional?;
}

contract OptionInOption {
    data: ContainerOpt;

    init() {
        self.data = ContainerOpt {
            embedded: DeepOptional{
                a: null,
                b: "hi"
            }
        };
    }
}