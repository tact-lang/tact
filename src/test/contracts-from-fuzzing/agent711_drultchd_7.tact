struct DeepOptional {
    optInt: Int?;
    optBool: Bool?;
}

struct Outer {
    nested: DeepOptional?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: null,
        };
    }
}