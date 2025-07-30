struct OptBoolCombo {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
}

contract BoolOptMix {
    data: OptBoolCombo;

    init() {
        self.data = OptBoolCombo{
            a:true, b:null, c:false, d:true
        };
    }
}