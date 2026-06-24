struct Pair {
    a: Int;
    b: Int;
}
struct Quad {
    p1: Pair;
    p2: Pair;
}
contract TestContract {
    quad: Quad;
    init() {
        self.quad = Quad{
            p1: Pair{ a: 1, b: 2 },
            p2: Pair{ a: 3, b: 4 }
        };
    }
}