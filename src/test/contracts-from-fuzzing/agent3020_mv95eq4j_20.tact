struct Inner {
    x: Int;
    y: Int;
}

struct Outer {
    inner1: Inner?;
    inner2: Inner;
}

contract OptMixed {
    val: Outer;

    init() {
        self.val = Outer{
            inner1: null,
            inner2: Inner{ x:1, y:2 }
        };
    }
}
