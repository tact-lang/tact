struct DeepOptional {
    nested: InnerOpt?;
}

struct InnerOpt {
    flag: Bool;
}

contract TestContract {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            nested: null
        };
    }
}