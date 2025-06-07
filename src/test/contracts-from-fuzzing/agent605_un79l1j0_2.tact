struct Inner {
    z: Int;
    flag: Bool;
}

struct Outer {
    inner: Inner;
    x: Int;
}

contract DeepNest {
    val: Outer;

    init() {
        self.val = Outer{
            inner: Inner{ z: 42, flag: true },
            x: 10
        };
    }
}