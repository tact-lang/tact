struct OptionalNested {
    a: Int?;
    b: InnerOptional?;
}

struct InnerOptional {
    c: Int?;
    d: Bool?;
}

contract OptionalNesting {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            a: null,
            b: null
        };
    }
}