struct Inner {
    z: Int;
}

struct Outer {
    inner: Inner;
    val: Int;
}

contract DeeplyNested {
    outer: Outer;
    init() {
        self.outer = Outer{inner: Inner{z: 42}, val: 7};
    }
}