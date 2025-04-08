struct Rec1 {
    field: Int;
}

contract SameStructTwice {
    s1: Rec1;
    s2: Rec1;

    init() {
        self.s1 = Rec1{field:42};
        self.s2 = Rec1{field:99};
    }
}