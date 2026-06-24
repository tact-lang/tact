struct Rec1 {
    val: Int;
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

contract TestContract {
    deeply: Rec5;

    init() {
        self.deeply = Rec5{
            r4: Rec4{
                r3: Rec3{
                    r2: Rec2{
                        r1: Rec1{ val: 123 }
                    }
                }
            }
        };
    }
}
