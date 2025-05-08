struct Outer {
    nested1: Inner;
    nested2: Inner;
    nested3: Inner;
}

struct Inner {
    foo: Int;
    bar: Bool;
    baz: String;
}

contract Test {
    field: Outer;

    init() {
        self.field = Outer{
            nested1: Inner{ foo:1, bar:true, baz:"a" },
            nested2: Inner{ foo:2, bar:false, baz:"b" },
            nested3: Inner{ foo:3, bar:true, baz:"c" }
        };
    }
}