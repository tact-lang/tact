struct Rec1 {
    val: Int;
}

struct Rec2 {
    rec: Rec1;
}

struct Rec3 {
    rec: Rec2;
}

contract RecChain {
    root: Rec3;

    init() {
        self.root = Rec3{rec: Rec2{rec: Rec1{val:999}}};
    }
}
