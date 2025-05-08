struct NestedOptional {
    f: Int?;
}

struct Container {
    nested: NestedOptional?;
}

contract ComplexNestedOptional {
    val: Container;
    init() {
        self.val = Container{ nested: null };
    }
}