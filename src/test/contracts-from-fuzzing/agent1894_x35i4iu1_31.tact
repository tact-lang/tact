struct InnerSt {
    a: Int;
}

struct OuterSt {
    in1: InnerSt;
    in2: InnerSt;
}

contract NestedMulti {
    data: OuterSt;
    init() {
        self.data = OuterSt{
            in1: InnerSt{ a:1 },
            in2: InnerSt{ a:2 }
        };
    }
}
