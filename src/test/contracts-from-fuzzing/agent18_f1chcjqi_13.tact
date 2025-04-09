struct BigNest {
    a: Int;
    b: Nested1;
}

struct Nested1 {
    c: Nested2;
    d: Nested3;
}

struct Nested2 {
    e: Int?;
}

struct Nested3 {
    f: Bool?;
}

contract BigNestContract {
    state: BigNest;
    init() {
        self.state = BigNest{
            a: 1,
            b: Nested1{
                c: Nested2{ e: null },
                d: Nested3{ f: null }
            }
        };
    }
}