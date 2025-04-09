struct Pair {
    a: Int;
    b: Int;
}

struct Triple {
    p: Pair;
    x: Int;
}

contract NestedInits {
    var: Triple = Triple{
        p: Pair{a:1,b:2},
        x: 3
    };

    init() {
        self.var = Triple{
            p: Pair{a: 10, b: 20},
            x: 30
        };
    }
}
