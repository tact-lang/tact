struct Inner {
    a: Int;
    b: Int?;
    c: Bool;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract DeepNest {
    state: Outer;

    init() {
        self.state = Outer{
            nested: Inner{
                a: 42,
                b: null,
                c: true,
            },
            flag: false,
        };
    }
}
