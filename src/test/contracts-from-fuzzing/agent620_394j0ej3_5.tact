struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Inner;
    z: Address;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            inner: Inner{x: 10, y: false},
            z: myAddress()
        };
    }

    receive() {
        let _ = self.state.inner.x;
        let _ = self.state.inner.y;
        let _ = self.state.z;
    }
}