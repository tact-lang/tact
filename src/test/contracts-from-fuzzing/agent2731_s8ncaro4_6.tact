struct DeepOptional {
    nested: Int?;
    text: String?;
    flag: Bool?;
}

struct Outer {
    a: DeepOptional?;
    b: Int;
}

contract OptionalsInStructs {
    field: Outer;

    init() {
        self.field = Outer{
            a: null,
            b: 10
        };
    }
}