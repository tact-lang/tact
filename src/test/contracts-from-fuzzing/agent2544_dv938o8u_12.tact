struct Rec1 {
    a: Int;
    b: Rec2;
}

struct Rec2 {
    x: Int;
}

contract RecursiveDepth {
    field: Rec1;
    init() {
        self.field = Rec1{
            a: 10,
            b: Rec2{ x: 20 }
        };
    }
}