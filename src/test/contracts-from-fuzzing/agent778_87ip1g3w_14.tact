struct Rec1 {
    a: Int;
    b: Bool;
}

struct Rec2 {
    r1: Rec1;
    c: Bool?;
}

struct Rec3 {
    r2: Rec2;
    d: Int;
}

contract RecursiveDepth {
    data: Rec3;
    init() {
        self.data = Rec3{
            r2: Rec2{ r1: Rec1{ a: 5, b: false }, c: null },
            d: 33
        };
    }
}