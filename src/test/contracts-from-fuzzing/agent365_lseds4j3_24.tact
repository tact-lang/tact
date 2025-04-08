struct InnerLevel {
    optNum: Int?;
    valid: Bool;
}

struct UpperLevel {
    nested: InnerLevel?;
    message: String;
}

contract OptionalComplex {
    content: UpperLevel;

    init() {
        self.content = UpperLevel{
            nested: null,
            message: "data"
        };
    }
}