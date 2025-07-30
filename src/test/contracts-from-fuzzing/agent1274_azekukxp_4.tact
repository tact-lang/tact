struct InnerMost {
    val: Int;
}

struct Inner {
    nested: InnerMost;
}

struct Outer {
    inr: Inner;
}

contract MultiNestedStruct {
    st: Outer;

    init() {
        self.st = Outer { inr: Inner { nested: InnerMost { val: 123 } } };
    }
}