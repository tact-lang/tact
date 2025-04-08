struct Inner {
    z: Int; // no default
}

struct Outer {
    mid: Inner?;
}

contract Test {
    data: Outer?;
    init() {
        self.data = null; // only outer optional null
    }
}