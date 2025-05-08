struct Inner {
    x: Int as int16;
    y: Int as uint3;
}

struct Outer {
    val: Int;
    inner: Inner;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{ val:123, inner: Inner{ x:-123, y:5 } };
    }
}