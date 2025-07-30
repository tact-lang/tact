struct OptionalIntBool {
    a: Int?;
    b: Bool?;
}

struct NestedOptional {
    inner: OptionalIntBool?;
    flag: Bool;
}

contract OptionalInsideOptional {
    nested: NestedOptional;
    init() {
        self.nested = NestedOptional{
            inner: OptionalIntBool{ a: 99, b: false },
            flag: true,
        };
    }
}