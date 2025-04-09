struct InnerNested {
    i: Int;
    b: Bool;
}

struct OuterMore {
    a: InnerNested;
    flag: Bool;
}

struct RootMost {
    val: OuterMore;
    count: Int;
}

contract TripleDeepNest {
    s: RootMost;
    init() {
        self.s = RootMost{
            val: OuterMore{
                a: InnerNested{i:1,b:true},
                flag:false
            },
            count: 42
        };
    }
}