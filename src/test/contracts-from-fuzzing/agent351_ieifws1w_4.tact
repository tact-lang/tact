struct NestedOptional {
    nestedOpt: Bool?;
    x: Int;
}

struct Outer {
    nested: NestedOptional?;
}

contract ComplexOptionals {
    outer: Outer;

    init() {
        self.outer = Outer{ nested: null };
    }
}