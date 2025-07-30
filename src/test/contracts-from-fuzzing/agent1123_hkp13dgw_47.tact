struct Inner {
    foo: Int?;
}

struct Outer {
    bar: Inner;
}

contract OptNestedNulls {
    nested: Outer;

    init() {
        self.nested = Outer{
            bar: Inner{foo:null}
        };
    }
}