struct Rec {
    val: Int;
}

contract TestContract {
    r1: Rec;
    r2: Rec?;
    r3: Rec?;

    init() {
        let v = Rec{ val: 40 };
        self.r1 = v;
        self.r2 = v;
        self.r3 = null;
    }
}