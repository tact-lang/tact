struct Inner {
    foo: Int;
    bar: String;
}

struct Middle {
    a: Inner;
    b: Int;
    c: Bool;
}

struct Outer {
    m: Middle;
    s: String;
}

contract NestedStructLayers {
    storage: Outer;

    init() {
        self.storage = Outer{
            m: Middle{
                a: Inner{foo:7, bar:"hi"},
                b: 1,
                c: true
            },
            s: "out"
        };
    }
}