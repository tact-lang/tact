struct InnerMost {
    a: Int;
    b: Bool;
}

struct Inner {
    c: InnerMost;
    d: Bool?;
}

struct Outer {
    e: Inner;
    f: Int?;
}

contract TestContract {
    complexField: Outer;

    init() {
        self.complexField = Outer{
            e: Inner{
                c: InnerMost{
                    a: 1,
                    b: true
                },
                d: false
            },
            f: null
        };
    }
}