struct Rec {
    val: Int;
}

contract ManyVars {
    v1: Rec;
    v2: Rec;
    v3: Rec;
    v4: Rec;
    v5: Rec;
    v6: Rec;
    v7: Rec;
    v8: Rec;
    v9: Rec;
    v10: Rec;

    init() {
        self.v1 = Rec{val: 1};
        self.v2 = Rec{val: 2};
        self.v3 = Rec{val: 3};
        self.v4 = Rec{val: 4};
        self.v5 = Rec{val: 5};
        self.v6 = Rec{val: 6};
        self.v7 = Rec{val: 7};
        self.v8 = Rec{val: 8};
        self.v9 = Rec{val: 9};
        self.v10 = Rec{val: 10};
    }
}