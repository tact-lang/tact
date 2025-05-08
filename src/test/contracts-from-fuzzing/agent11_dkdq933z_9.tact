// Test struct with nested tuples (which in tact can be simulated by nested structs)

struct Pair {
    x: Int;
    y: Int;
}

struct Triple {
    p: Pair;
    z: Int;
}

contract TestContract {
    t: Triple;

    init() {
        self.t = Triple{
            p: Pair{ x:1, y:2 },
            z:3
        };
    }
}