struct Sub1 {
    a: Int;
    b: String;
}

struct Sub2 {
    c: Bool;
    d: Address;
}

struct Aggregate {
    s1: Sub1;
    s2: Sub2;
    e: Bool?;
    f: String?;
}

contract NestedMix {
    agg: Aggregate;

    init() {
        self.agg = Aggregate{
            s1: Sub1{ a:1, b:"b" },
            s2: Sub2{ c:true, d:myAddress() },
            e: null,
            f: null,
        };
    }
}
