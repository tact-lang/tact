struct InnerA { x: Int; }
struct InnerB { y: String; }
struct Complex {
    a: InnerA?;
    b: InnerB;
    c: Bool?;
}

contract DeepMix {
    f: Complex;

    init() {
        self.f = Complex{
            a: null,
            b: InnerB{ y: "str" },
            c: true
        };
    }
}