struct Rec {
    a: Int;
}

contract TopOptInner {
    rec: Rec?;

    init() {
        self.rec = Rec{a:7};
    }
}
