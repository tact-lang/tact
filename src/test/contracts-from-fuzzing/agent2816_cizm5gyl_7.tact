struct DeepOptionals {
    innerOpt: Int?;
    flagOpt: Bool?;
    textOpt: String?;
}

struct OuterOptional {
    nested: DeepOptionals?;
    mainVal: Int;
}

contract DeepOptionalFields {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            nested: null,
            mainVal: 42,
        };
    }
}