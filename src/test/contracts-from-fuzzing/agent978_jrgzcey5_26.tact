// optional wrapper field with nested defaulted inner optional fields
struct InnerInner {
    a: Int?;
    b: String = "d";
}

struct Inner {
    ii: InnerInner?;
    c: Bool;
}

contract NullOuterWithDefaultedDeep {
    inner: Inner?;

    init() {
        self.inner = null;
    }
}