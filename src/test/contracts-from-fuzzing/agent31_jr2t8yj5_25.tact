struct OptionalDeepDefault {
    a: Int?;
    b: NestedDefault?;
}

struct NestedDefault {
    c: Int? = null;
    d: Bool? = null;
}

contract Test {
    val: OptionalDeepDefault;
    init() {
        self.val = OptionalDeepDefault{
            a: null,
            b: null,
        };
    }
}
