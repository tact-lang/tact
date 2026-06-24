struct BoolIntCombo {
    aa: Bool;
    bb: Int;
    cc: Bool?;
    dd: Int?;
}

contract BoolIntContract {
    rec: BoolIntCombo;

    init() {
        self.rec = BoolIntCombo{
            aa:true, bb:7, cc:null, dd:42
        };
    }
}