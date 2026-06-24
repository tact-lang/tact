struct Inner {
    z: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    mid: Middle;
}

contract TestContract {
    deep: Outer;

    init() {
        self.deep = Outer{ mid: Middle{ inner: Inner{ z: 111 } } };
    }
}