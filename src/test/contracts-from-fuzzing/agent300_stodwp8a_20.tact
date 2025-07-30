struct Pair {
    a: Int;
    b: Bool;
}

struct Triple {
    x: Int;
    y: String;
    z: Bool;
}

contract TestContract {
    p1: Pair;
    p2: Pair;
    t: Triple;

    init() {
        self.p1 = Pair{a:1, b:true};
        self.p2 = Pair{a:2, b:false};
        self.t = Triple{x:3, y:"hello", z:true};
    }
}