struct Sub {
    iv: Int;
    bv: Bool;
}

contract OptInStruct {
    oSub: Sub?;
    init() {
        self.oSub = null;
    }
}
// Optional complex struct directly as contract var without wrapper