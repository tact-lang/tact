struct DeepOptional {
    nested: NestedOpt?;
}

struct NestedOpt {
    x: Int?;
    flag: Bool;
}

contract TestContract {
    d: DeepOptional;

    init() {
        self.d = DeepOptional {
            nested: null
        };
    }
}