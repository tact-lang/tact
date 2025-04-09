struct BoolCombo {
    f1: Bool;
    f2: Bool?;
    f3: Bool;
    f4: Bool?;
}

contract TestContract {
    data: BoolCombo;
    init() {
        self.data = BoolCombo{ f1:true, f2:null, f3:false, f4:true };
    }
}