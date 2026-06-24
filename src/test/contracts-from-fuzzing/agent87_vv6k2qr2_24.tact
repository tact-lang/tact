struct Rec1 {
    rec2: Rec2;
}
struct Rec2 {
    rec3: Rec3;
}
struct Rec3 {
    rec4: Rec4;
}
struct Rec4 {
    rec5: Rec5;
}
struct Rec5 {
    rec6: Rec6;
}
struct Rec6 {
    num: Int;
}

contract RecursiveSix {
    big: Rec1;

    init() {
        self.big = Rec1{
            rec2: Rec2{
                rec3: Rec3{
                    rec4: Rec4{
                        rec5: Rec5{
                            rec6: Rec6{
                                num: 777
                            }
                        }
                    }
                }
            }
        };
    }
}
