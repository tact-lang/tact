struct Sub1 { a: Int; }
struct Sub2 { b: Bool; }
struct Sub3 { c: String; }
struct Sub4 { d: Address; }

struct WideNest {
    s1: Sub1;
    s2: Sub2;
    s3: Sub3;
    s4: Sub4;
}

contract WideNestedInit {
    field: WideNest;

    init() {
        self.field = WideNest{
            s1: Sub1{ a:1 },
            s2: Sub2{ b:true },
            s3: Sub3{ c:"abc" },
            s4: Sub4{ d:myAddress() }
        };
    }
}