struct Rec {
    val: Int;
    flag: Bool;
}

contract FlatNested {
    rec1: Rec;
    rec2: Rec;

    init() {
        self.rec1 = Rec{val:1,flag:true};
        self.rec2 = Rec{val:2,flag:false};
    }
}
