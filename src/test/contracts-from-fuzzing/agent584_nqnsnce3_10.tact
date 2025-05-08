struct Pair { k: Int; v: Int; }

struct Container {
    p1: Pair;
    p2: Pair;
    p3: Pair;
    p4: Pair;
    p5: Pair;
}

contract Test {
    c: Container = Container{
        p1: Pair{k:1,v:2},
        p2: Pair{k:3,v:4},
        p3: Pair{k:5,v:6},
        p4: Pair{k:7,v:8},
        p5: Pair{k:9,v:10}
    };
}