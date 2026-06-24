struct Inner {
    a: Int;
}

struct Outer {
    x: Int;
    inr: Inner;
    y: Int;
}

contract NestedMiddleField {
    val: Outer;
    init() {
        self.val = Outer{ x:1, inr: Inner{a:2}, y:3 };
    }
    receive() {}
}