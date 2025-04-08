struct Sub1 { a: Int; }
struct Sub2 { b: Int; }
struct Sub3 { c: Int; }
struct Sub4 { d: Int; }
struct Sub5 { e: Int; }
struct Sub6 { f: Int; }

struct Aggregate {
    s1: Sub1; s2: Sub2; s3: Sub3; s4: Sub4; s5: Sub5; s6: Sub6;
}

contract AggTest {
    agg: Aggregate;
    init() {
        self.agg = Aggregate{
            s1: Sub1{ a: 1 },
            s2: Sub2{ b: 2 },
            s3: Sub3{ c: 3 },
            s4: Sub4{ d: 4 },
            s5: Sub5{ e: 5 },
            s6: Sub6{ f: 6 }
        };
    }
}