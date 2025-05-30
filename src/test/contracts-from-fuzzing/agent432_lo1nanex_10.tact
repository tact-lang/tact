struct InnerMost {
    foo: Int?;
}

struct Inner {
    im: InnerMost?;
}

contract OptNestedDeep {
    nested: Inner?;

    init() {
        self.nested = Inner{
            im: InnerMost{
                foo: 123,
            }
        };
    }
}
