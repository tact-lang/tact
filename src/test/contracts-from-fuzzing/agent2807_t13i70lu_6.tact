struct Inner {
    x: Int;
}

struct Outer {
    i: Inner;
    y: Int;
}

contract DeepNestedStruct {
    val: Outer;
    init() {
        self.val = Outer{ i: Inner{ x: 10 }, y: 20 };
    }
}