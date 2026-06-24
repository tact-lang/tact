struct S {
    a: Int;
    b: Bool;
}

contract Optionals {
    sOpt: S?;
    numOpt: Int?;
    boolOpt: Bool?;

    init() {
        self.sOpt = null;
        self.numOpt = null;
        self.boolOpt = null;
    }
}