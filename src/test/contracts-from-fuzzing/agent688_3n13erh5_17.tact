struct Pair {
    a: Int;
    b: Bool;
}

struct Quad {
    p1: Pair;
    p2: Pair;
    p3: Pair;
    p4: Pair;
}

contract TestContract {
    quad: Quad;

    init() {
        self.quad = Quad{
            p1: Pair{a:1,b:true},
            p2: Pair{a:2,b:false},
            p3: Pair{a:3,b:true},
            p4: Pair{a:4,b:false},
        };
    }
}