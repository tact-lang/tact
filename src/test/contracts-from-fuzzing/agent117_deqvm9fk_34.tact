struct Rec {
    val: Int;
}

contract OptMult {
    f1: Rec?;
    f2: Rec?;
    f3: Rec?;

    init() {
        self.f1 = Rec{val:1};
        self.f2 = null;
        self.f3 = Rec{val:3};
    }
}
