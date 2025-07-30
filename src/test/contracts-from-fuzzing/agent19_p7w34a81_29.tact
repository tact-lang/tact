struct DeepA { a: Int; }
struct DeepB { b: Int; }
struct DeepC { c: Int; }
struct DeepD { d: Int; }

struct DeepMerge {
    a: DeepA;
    b: DeepB;
    c: DeepC;
    d: DeepD;
}

contract DeepComposite {
    dm: DeepMerge;

    init() {
        self.dm = DeepMerge{
            a: DeepA{ a: 1 },
            b: DeepB{ b: 2 },
            c: DeepC{ c: 3 },
            d: DeepD{ d: 4 },
        };
    }
}