struct Rec2 {
    val: Int;
    rec1: Rec1;
}

struct Rec1 {
    val: Int;
}

contract OutOfOrderStructs {
    s: Rec2;

    init() {
        self.s = Rec2{
            val: 1,
            rec1: Rec1{ val: 2 }
        };
    }
}
