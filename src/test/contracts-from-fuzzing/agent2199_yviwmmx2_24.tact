struct Rec1 {
    val: Int;
}

struct Rec2 {
    rec: Rec1;
}

struct Rec3 {
    rec: Rec2;
}

struct Rec4 {
    rec: Rec3;
}

contract ManyRecursion {
    r: Rec4;
    init() {
        self.r = Rec4{
            rec: Rec3{
                rec: Rec2{
                    rec: Rec1{val: 77}
                }
            }
        };
    }
}
