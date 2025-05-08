struct Nested {
    n1: Int;
    n2: String?;
}

struct Complex {
    a: Int = 7;
    b: Nested;
    c: Bool?;
}

contract Mixes {
    combo: Complex;

    init() {
        self.combo = Complex{
            a: 9,
            b: Nested{ n1: 5, n2: null },
            c: null
        };
    }
}
