struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    foo: Int;
    nested: Inner;
    bar: Int?;
}

contract StructFieldNestTest {
    sfield: Outer;
    init() {
        self.sfield = Outer{
            foo: 1,
            nested: Inner{
                a: 2,
                b: true,
            },
            bar: null,
        };
    }
}