struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
}

struct Wrap {
    nested: NestedOptionals?;
    val: Int;
}

contract OptionalNestedStructField {
    f: Wrap;

    init() {
        self.f = Wrap{
            nested: null,
            val: 7,
        };
    }
}