struct Pair {
    one: Int;
    two: Bool;
}

struct ManyNested {
    p1: Pair;
    p2: Pair;
    p3: Pair;
    p4: Pair;
    p5: Pair;
    p6: Pair;
    p7: Pair;
    p8: Pair;
}

contract TestContract {
    nestedStructs: ManyNested;

    init() {
        self.nestedStructs = ManyNested{
            p1: Pair{one:1,two:true},
            p2: Pair{one:2,two:false},
            p3: Pair{one:3,two:true},
            p4: Pair{one:4,two:false},
            p5: Pair{one:5,two:true},
            p6: Pair{one:6,two:false},
            p7: Pair{one:7,two:true},
            p8: Pair{one:8,two:false}
        };
    }
}