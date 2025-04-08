struct OutOrderNested {
    a: Int;
    s: SubInner;
    b: Int;
}

struct SubInner {
    foo: Int;
    bar: String;
}

contract OrderNestedFields {
    f: OutOrderNested;

    init() {
        self.f = OutOrderNested{
            a:1,
            s:SubInner{ foo:2, bar:"b" },
            b:3
        };
    }
}