struct InnerNested {
    inner: String;
}

struct Outer {
    nestedOpt: InnerNested?;
}

contract NestedOptionals {
    data: Outer;

    init() {
        self.data = Outer{ nestedOpt: null };
    }
}