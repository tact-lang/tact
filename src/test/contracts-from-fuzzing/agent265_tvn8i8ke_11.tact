struct Pair {
    x: Int;
    y: Int;
}

struct Complex {
    p1: Pair;
    p2: Pair;
    s: String;
    flag: Bool;
}

contract Test {
    complexState: Complex;

    init() {
        self.complexState = Complex{
            p1: Pair{ x:1, y:2 },
            p2: Pair{ x:3, y:4 },
            s: "data",
            flag: true,
        };
    }
}