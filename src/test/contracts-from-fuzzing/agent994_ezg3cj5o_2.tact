struct NestedOptional {
    inner: Int?;
}

struct Outer {
    nested: NestedOptional?;
}

contract TestContract {
    value: Outer;

    init() {
        self.value = Outer{ nested: null };
    }
}