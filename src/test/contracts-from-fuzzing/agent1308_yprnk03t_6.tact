struct BigNested {
    a: Int;
    b: Int?;
    c: Sub1;
    d: Sub2?;
}

struct Sub1 {
    v1: Int;
    v2: Bool;
}

struct Sub2 {
    s1: Bool?;
    s2: Int;
    s3: Bool;
}

contract TestContract {
    state: BigNested;

    init() {
        self.state = BigNested {
            a: 10,
            b: null,
            c: Sub1 { v1: 1, v2: true },
            d: null
        };
    }
}