struct Rec {
    a: Int;
    b: Int;
}

struct OuterRec {
    x: Rec;
    y: Rec;
}

contract MultiRec {
    v: OuterRec;
    
    init() {
        self.v = OuterRec{
            x: Rec { a: 1, b: 2 },
            y: Rec { a: 3, b: 4 },
        };
    }
}