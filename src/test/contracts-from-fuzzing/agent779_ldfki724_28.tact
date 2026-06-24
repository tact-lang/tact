struct Alpha { a: Int; }
struct Beta { b: Int?; }
struct Gamma { c: Bool; }
struct Delta { d: Bool?; }

struct Complex {
    a: Alpha;
    b: Beta;
    c: Gamma;
    d: Delta;
}

contract ManyStructsDeep {
    val: Complex;

    init() {
        self.val = Complex{
            a: Alpha{ a: 1 },
            b: Beta{ b: null },
            c: Gamma{ c: true },
            d: Delta{ d: false }
        };
    }
}