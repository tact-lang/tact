struct Inner {
    z: Int;
}

struct Outer {
    inner: Inner?;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{ inner: null };
    }
}