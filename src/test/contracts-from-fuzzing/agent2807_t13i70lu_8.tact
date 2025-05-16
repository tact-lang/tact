struct Inner {
    val: Int;
}

struct Outer {
    maybe: Inner?;
    count: Int;
}

contract OptionalNestedStruct {
    val: Outer;
    init() {
        self.val = Outer{ maybe: null, count: 5 };
    }
}