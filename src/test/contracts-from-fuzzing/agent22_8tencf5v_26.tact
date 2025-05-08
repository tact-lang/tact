// Contract with nested tuples simulated via structs (since no explicit tuples)
struct Pair {
    a: Int;
    b: Bool;
}

struct Quad {
    one: Pair;
    two: Pair;
}

contract TupleLike {
    data: Quad;

    init() {
        self.data = Quad{
            one: Pair{a:1,b:true},
            two: Pair{a:2,b:false}
        };
    }
}