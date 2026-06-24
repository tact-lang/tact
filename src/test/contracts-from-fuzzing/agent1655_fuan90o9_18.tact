struct BoolCombo {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
}

contract BoolMixTest {
    state: BoolCombo;

    init() {
        self.state = BoolCombo{
            a:true, b:null, c:false, d:true
        };
    }
}
