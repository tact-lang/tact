struct Inner {
    a: Int;
    b: Bool;
    s: String?;
}

struct Mid1 {
    m1: Inner;
    m2: Inner;
}

struct Mid2 {
    m3: Inner;
    m4: Inner;
}

struct Root {
    r1: Mid1;
    r2: Mid2;
}

contract WideTreeContract {
    data: Root;

    init() {
        self.data = Root{
            r1: Mid1{
                m1: Inner{ a: 1, b: true, s: "one" },
                m2: Inner{ a: 2, b: false, s: null }
            },
            r2: Mid2{
                m3: Inner{ a: 3, b: true, s: "three" },
                m4: Inner{ a: 4, b: false, s: "four" }
            }
        };
    }
}