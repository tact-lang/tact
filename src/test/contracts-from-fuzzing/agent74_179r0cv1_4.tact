struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner?;
}

contract TestContract {
    payload: Outer;

    init() {
        self.payload = Outer{ inner: null };
    }
}