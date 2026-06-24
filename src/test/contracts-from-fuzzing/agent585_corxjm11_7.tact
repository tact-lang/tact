struct OptionalNested {
    inner: Int?;
}

struct MiddleS {
    s: OptionalNested?;
}

contract OptionalStructNesting {
    ms: MiddleS?;

    init() {
        self.ms = MiddleS{ s: OptionalNested{ inner: 7 } };
    }
}