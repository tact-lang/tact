struct Rec1 {
    a: Int;
    b: Int;
}

struct Rec2 {
    r1: Rec1;
    c: Int;
}

struct Rec3 {
    r2: Rec2;
    d: Int;
}

struct Rec4 {
    r3: Rec3;
    e: Int;
}

contract DeepRec {
    data: Rec4;

    init() {
        self.data = Rec4{
            r3: Rec3{
                r2: Rec2{
                    r1: Rec1{ a:1, b:2 }, c:3
                },
                d:4
            },
            e:5
        };
    }
}