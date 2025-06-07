struct Inner {
    a: Int;
    b: Bool;
}

struct Mid {
    m: Inner;
    opt_val: Int?;
}

struct Outer {
    inr: Mid;
    s: String;
}

contract ComplexNested {
    data: Outer;

    init() {
        self.data = Outer{
            inr: Mid{
                m: Inner{ a: 10, b: false },
                opt_val: null
            },
            s: "done"
        };
    }

    receive() {}
}