struct Inner {
    foo: Int as uint32;
    bar: Bool;
}

struct Outer {
    baz: Inner;
    qux: Int as int64;
}

contract SerializeMix {
    val: Outer;

    init() {
        self.val = Outer{
            baz: Inner{ foo: 1234, bar: true },
            qux: -5678,
        };
    }
}