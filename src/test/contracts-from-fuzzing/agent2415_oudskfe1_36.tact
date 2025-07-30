struct Rec1 {
    a: Int;
}

struct Rec2 {
    b: Int;
}

struct Rec3 {
    r1: Rec1;
    r2: Rec2;
}

contract RecFields {
    rec: Rec3;

    init() {
        self.rec = Rec3{
            r1: Rec1{a:5},
            r2: Rec2{b:10}
        };
    }
}