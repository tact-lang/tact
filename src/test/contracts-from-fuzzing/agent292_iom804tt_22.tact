struct DeepCombo {
    opt: Int?;
    inner: Inner;
    strOpt: String?;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract DeepComboTest {
    f: DeepCombo;

    init() {
        self.f = DeepCombo{
            opt:null,
            inner:Inner{ a:5, b:true },
            strOpt:null
        };
    }
}