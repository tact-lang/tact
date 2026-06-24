struct Inner {
    val: Int;
}

struct Outer {
    inner: Inner;
}

contract NestedUnset {
    val: Outer;
    init() {
        self.val = Outer{inner:Inner{val:1}};
    }
}