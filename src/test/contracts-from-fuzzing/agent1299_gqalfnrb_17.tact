struct Rec {
    a: Int;
    b: Int;
}

contract OptRec {
    rec: Rec?;
    
    init() {
        self.rec = Rec{ a:1, b:2 };
    }
}