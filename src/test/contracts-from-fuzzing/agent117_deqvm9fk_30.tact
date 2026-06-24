struct Rec {
    val: Int;
}

contract ListOfFields {
    f1: Rec;
    f2: Rec;
    f3: Rec;
    f4: Rec;
    f5: Rec;

    init() {
        self.f1 = Rec{val:1};
        self.f2 = Rec{val:2};
        self.f3 = Rec{val:3};
        self.f4 = Rec{val:4};
        self.f5 = Rec{val:5};
    }
}
