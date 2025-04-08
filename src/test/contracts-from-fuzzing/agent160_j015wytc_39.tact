struct InnerA {
    a: Int?;
    b: Int = 5;
}

struct InnerB {
    c: String?;
    d: Bool = true;
}

struct Outer {
    ia: InnerA?;
    ib: InnerB;
    e: Int = 10;
}

contract ComplexFields {
    f: Outer;
    init() {
        self.f = Outer{
            ia: InnerA{a:null},
            ib: InnerB{c: null},
        };
    }
}