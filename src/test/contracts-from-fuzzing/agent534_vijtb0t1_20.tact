struct BoolCombo {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
}

contract ManyBools {
    bs: BoolCombo;

    init() {
        self.bs = BoolCombo{
            a:true,b:false,c:true,d:false
        };
    }
}