struct Outer {
    foo: Int;
    nested: Inner;
}

struct Inner {
    bar: Int?;
}

contract MultiLayerOpt {
    s: Outer;

    init() {
        self.s = Outer{ foo:1, nested: Inner{ bar:null } };
    }
}