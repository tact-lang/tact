struct Inner {
    nested: Int;
}

struct Outer {
    optNested: Inner?;
}

contract NestedOptionalStruct {
    data: Outer;

    init() {
        self.data = Outer{ optNested: null };
    }
}