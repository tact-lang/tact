struct NestedOpt {
    a: Int?;
}

struct Container {
    inner: NestedOpt?;
}

contract OptionalStructField {
    c: Container;

    init() {
        self.c = Container { inner: null };
    }
}
