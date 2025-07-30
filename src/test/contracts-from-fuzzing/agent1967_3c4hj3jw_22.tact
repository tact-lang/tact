contract TestContract {
    nested_opt: Outer?;
    init() {
        self.nested_opt = null;
    }
}

struct Outer {
    inner: Inner;
    extra: Int;
}

struct Inner {
    x: Int;
    y: Bool;
    z: String;
}