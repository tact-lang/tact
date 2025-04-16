struct InnerMost {
    foo: Int?;
}

struct Inner {
    nested: InnerMost?;
}

struct Outer {
    inner: Inner?;
}

contract DeeplyNestedOptionals {
    data: Outer;

    init() {
        self.data = Outer{ inner: null };
    }
}