struct BoolCombo {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
}

contract ManyBools {
    flags: BoolCombo;

    init() {
        self.flags = BoolCombo{a:true,b:false,c:true,d:false};
    }
}