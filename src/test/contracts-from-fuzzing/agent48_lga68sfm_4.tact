struct Inner {
    X: Int;
}

struct Outer {
    I: Inner;
    Y: Int;
}

fun testNested(): Int {
    let o = Outer {
        I: Inner { X: 42 },
        Y: 10
    };
    return o.I.X + o.Y;
}

contract TestNested {
    receive() {
        testNested();
    }
}
