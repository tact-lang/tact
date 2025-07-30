struct Rec1 {
    a: Int;
    b: Int?;
    c: Rec2;
}

struct Rec2 {
    x: Int;
    y: Int?;
    z: Rec3;
}

struct Rec3 {
    q: Int;
    r: Int?;
}

contract Test {
    rec: Rec1;

    init() {
        self.rec = Rec1{
            a: 1,
            b: null,
            c: Rec2{
                x: 2,
                y: null,
                z: Rec3{
                    q: 3,
                    r: null
                }
            }
        };
    }
}