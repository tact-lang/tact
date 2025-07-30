// optional struct wrapping optional struct wrapping optional struct (3x opt chain)
struct I {
    x: Int?;
}

struct M {
    i: I?;
}

struct O {
    m: M?;
}

contract TripleOptChain {
    o: O?;

    init() {
        self.o = null;
    }
}