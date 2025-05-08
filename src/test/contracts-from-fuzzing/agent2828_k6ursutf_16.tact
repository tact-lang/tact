struct Coord { x: Int = 0; y: Int = 1; }

struct Complex {
    a: Int;
    b: Bool?;
    c: String = "abc";
    d: Coord?;
    e: Coord;
}

contract ComplexState {
    s: Complex;

    init() {
        self.s = Complex{
            a: 10,
            b: null,
            d: null,
            e: Coord{}
        };
    }
}