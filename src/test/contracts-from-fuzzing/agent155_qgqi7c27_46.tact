contract NestedStructOpt {
    data: Outer;
    init() {
        self.data = Outer{inner: null};
    }
}

struct Outer {
    inner: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
}
