struct Inner {
    x: Int;
    y: Bool;
    z: String?;
}

struct Outer {
    foo: Int;
    bar: Inner;
    baz: String;
}

contract StorageComplex {
    nested: Outer;

    init() {
        self.nested = Outer{
            foo: 42,
            bar: Inner{
                x: 7,
                y: true,
                z: "hello"
            },
            baz: "world"
        };
    }
}