struct S1 {
    intField: Int;
    strField: String;
}

struct S2 {
    boolField: Bool;
    optStr: String?;
}

contract TestContract {
    sf1: S1 = S1{intField: 100, strField: "abc"};
    sf2: S2 = S2{boolField: true, optStr: null};

    init() {
        self.sf1 = S1{intField: 200, strField: "def"};
        self.sf2 = S2{boolField: false, optStr: "xyz"};
    }
    receive() {}
}