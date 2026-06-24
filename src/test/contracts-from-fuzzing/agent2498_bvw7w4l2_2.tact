struct Inner {
    i: Int;
    b: Bool;
}

struct Middle {
    m1: Inner;
    m2: Bool;
}

struct Outer {
    o1: Middle;
    o2: Int;
    o3: String;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            o1: Middle{
                m1: Inner{
                    i: 10,
                    b: false,
                },
                m2: true,
            },
            o2: 20,
            o3: "deep",
        };
    }
}