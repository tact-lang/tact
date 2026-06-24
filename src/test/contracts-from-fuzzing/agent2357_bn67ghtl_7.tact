struct Rec {
    a: Int;
    b: Int;
}

contract ComplexDefault {
    val: Rec = Rec{ a: 1, b: 2 };
    optRec: Rec? = null;

    init() {
        self.val = Rec{ a: 3, b: 4 };
        self.optRec = null;
    }
}
