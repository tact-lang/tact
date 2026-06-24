struct OuterMost {
    a: Int;
    b: Nested1;
}

struct Nested1 {
    s: String;
    c: Nested2;
}

struct Nested2 {
    f: Bool;
    d: Nested3;
}

struct Nested3 {
    addr: Address;
    e: Bool;
}

contract DeepNest2 {
    x: OuterMost;

    init() {
        self.x = OuterMost{
            a: 10,
            b: Nested1{
                s: "X",
                c: Nested2{
                    f: true,
                    d: Nested3{
                        addr: myAddress(),
                        e: false
                    }
                }
            }
        };
    }
}
