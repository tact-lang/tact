struct Rec1 {
    n: Int;
}

struct Rec2 {
    r1: Rec1;
}

struct Rec3 {
    r2: Rec2;
}

struct Rec4 {
    r3: Rec3;
}

struct Rec5 {
    r4: Rec4;
}

contract VeryDeepNested {
    state: Rec5;

    init() {
        self.state = Rec5{
            r4: Rec4{
                r3: Rec3{
                    r2: Rec2{
                        r1: Rec1{
                            n: 123
                        }
                    }
                }
            }
        };
    }
}