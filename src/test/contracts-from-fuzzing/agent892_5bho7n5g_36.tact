struct Rec {
    a: Int;
    b: Bool?;
    c: String;
}

contract DoubleRec {
    r1: Rec;
    r2: Rec?;

    init() {
        self.r1 = Rec{a:5,b:null,c:"a"};
        self.r2 = null;
    }
}