struct NestedWithDefaults {
    n: Int = 7;
}

struct OuterWithOptionalNested {
    a: Int;
    maybe: NestedWithDefaults? = null;
}

contract NestedOptDefaults {
    data: OuterWithOptionalNested;

    init() {
        self.data = OuterWithOptionalNested{
            a: 42
        };
    }
}