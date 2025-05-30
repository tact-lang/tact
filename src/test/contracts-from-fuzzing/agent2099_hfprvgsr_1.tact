struct Inner {
    z: Int;
}

struct Outer {
    foo: Int;
    bar: String;
    nested: Inner;
}

contract NestedFieldsContract {
    s: Outer;

    init() {
        self.s = Outer{
            foo: 1,
            bar: "hello",
            nested: Inner{z: 99}
        };
    }
}