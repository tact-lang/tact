struct Leaf { z: Int?; }

struct Inner { leaf: Leaf?; }

struct Outer { inner: Inner?; }

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{
            inner: null
        };
    }
}