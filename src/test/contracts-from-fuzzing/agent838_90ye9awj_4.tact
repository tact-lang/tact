struct NestedStruct {
    a: Outer;
}

struct Outer {
    b: Middle;
}

struct Middle {
    c: Inner;
}

struct Inner {
    d: Bool;
}

contract DeepTest {
    val: NestedStruct;
    init() {
        self.val = NestedStruct {
            a: Outer{ b: Middle{ c: Inner{ d: true } } }
        };
    }
}