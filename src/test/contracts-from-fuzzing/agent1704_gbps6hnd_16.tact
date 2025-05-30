struct BigNestedOptional {
    one: Int?;
    two: InnerOpt1?;
    three: InnerOpt2?;
}

struct InnerOpt1 {
    x: Int;
    y: Bool;
}

struct InnerOpt2 {
    sub: InnerMost?;
}

struct InnerMost {
    message: String;
}

contract OptStructDeep {
    f: BigNestedOptional;

    init() {
        self.f = BigNestedOptional{
            one: null,
            two: null,
            three: null,
        };
    }
}