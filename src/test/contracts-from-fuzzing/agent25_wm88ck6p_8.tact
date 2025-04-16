struct DeepOptional {
    innerOpt: InnerStruct?;
}

struct InnerStruct {
    value: Int;
}

contract TestContract {
    store: DeepOptional;

    init() {
        self.store = DeepOptional{
            innerOpt: null,
        };
    }
}