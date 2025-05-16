struct InnerMost {
    val: String?;
}

struct Inner {
    i: InnerMost;
}

struct Outer {
    o: Inner;
}

contract NestedOptionalStruct {
    s: Outer;

    init() {
        self.s = Outer{ o: Inner{ i: InnerMost{ val: null } } };
    }
}
