struct Rec1 {
    val: Int;
}

struct Rec2 {
    sub: Rec1;
    flag: Bool;
}

contract MultiFieldSer {
    f1: Rec1;
    f2: Rec2;

    init() {
        self.f1 = Rec1{val: 7};
        self.f2 = Rec2{sub: Rec1{val: 8}, flag: true};
    }
}