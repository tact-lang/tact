struct Inner {
    x: Int;
    y: Int?;
}

struct Outer {
    inner: Inner;
    z: Bool?;
}

contract DeepNestedOptional {
    val: Outer;

    init() {
        self.val = Outer{inner: Inner{x: 1, y: null}, z: null};
    }

    receive() {
        self.val = Outer{inner: Inner{x: self.val.inner.x + 1, y: self.val.inner.y}, z: self.val.z};
    }
}