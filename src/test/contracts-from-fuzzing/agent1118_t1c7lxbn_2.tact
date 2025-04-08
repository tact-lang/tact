struct NestedOptional {
    inner: Int?;
    flag: Bool;
}

struct Outer {
    nested: NestedOptional?;
    value: Int;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{nested: null, value: 5};
    }
}