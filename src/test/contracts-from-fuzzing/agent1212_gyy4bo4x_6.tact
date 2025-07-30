struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: AnotherNested?;
}

struct AnotherNested {
    x: Int?;
    y: String?;
}

contract DeepOptional {
    s: NestedOptionals;

    init() {
        self.s = NestedOptionals{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}