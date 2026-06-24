struct Levels {
    a: Int;
    b: Int?;
}

struct Combined {
    l1: Levels;
    l2: Levels;
}

contract DoubleNested {
    data: Combined;

    init() {
        self.data = Combined{
            l1: Levels{ a: 1, b: null },
            l2: Levels{ a: 2, b: null }
        };
    }
}