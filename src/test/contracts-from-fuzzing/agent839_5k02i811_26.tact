struct Rec {
    a: Int;
    b: String;
}

contract OptRec {
    r: Rec?;
    init() {
        self.r = null;
    }
}