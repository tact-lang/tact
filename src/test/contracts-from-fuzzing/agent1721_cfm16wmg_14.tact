struct Rec1 {
    a: Int;
}

struct Rec2 {
    b: Rec1;
}

struct Rec3 {
    c: Rec2;
}

struct Rec4 {
    d: Rec3;
}

contract RecTest {
    rec: Rec4;

    init() {
        self.rec = Rec4{
            d: Rec3{
                c: Rec2{
                    b: Rec1{
                        a: 1234
                    }
                }
            }
        };
    }
}