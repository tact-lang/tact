struct NestedOptional {
    inner: Int?;
    flag: Bool;
}

struct Outer {
    nested: NestedOptional?;
    val: Int;
}

contract OptionalNest {
    field: Outer;
    init() {
        self.field = Outer{ nested: null, val: 9 };
    }
    receive() {}
}