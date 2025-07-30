struct Rec1 {
    i: Int;
}

struct Rec2 {
    one: Rec1;
}

struct Rec3 {
    two: Rec2;
}

struct Rec4 {
    three: Rec3;
}

struct Rec5 {
    four: Rec4;
}

struct Rec6 {
    five: Rec5;
}

contract RecTest {
    r: Rec6;

    init() {
        self.r = Rec6{
            five: Rec5{
                four: Rec4{
                    three: Rec3{
                        two: Rec2{
                            one: Rec1{
                                i: 7
                            }
                        }
                    }
                }
            }
        };
    }
}
