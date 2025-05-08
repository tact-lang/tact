struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    one: Int;
    inner: Inner;
    two: Int;
}

contract NestedStruct {
    data: Outer;

    init() {
        self.data = Outer {
            one: 1,
            inner: Inner{
                a: 11,
                b: 22
            },
            two: 2
        };
    }
}
