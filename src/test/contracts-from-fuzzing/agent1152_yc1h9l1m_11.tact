struct Rec1 {
    val1: Int;
    val2: Int;
}

struct Rec2 {
    s1: Rec1;
    s2: Rec1;
}

contract Test {
    data: Rec2;

    init() {
        self.data = Rec2{
            s1: Rec1{val1:1,val2:2},
            s2: Rec1{val1:3,val2:4}
        };
    }
}