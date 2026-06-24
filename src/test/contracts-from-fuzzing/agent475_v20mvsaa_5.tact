struct InnerMost {
    a: Int;
    b: Bool;
    c: String;
}

struct Inner {
    x: Int;
    z: InnerMost;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{
            x: 5,
            z: InnerMost{
                a: 2,
                b: false,
                c: "foo",
            },
        };
    }

    receive() {}
}