struct Inner { x: Int; y: Int; }

struct Outer { inner: Inner; }

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{ inner: Inner{ x: 1, y: 2 } };
    }
}