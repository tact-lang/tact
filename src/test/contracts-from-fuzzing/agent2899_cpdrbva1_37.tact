struct DeepCombo {
    opt1: Int?; opt2: Bool?; nested: InnerCombo;
}
struct InnerCombo {
    i: Int; b: Bool;
}

contract TestDeepCombo {
    f: DeepCombo;

    init() {
        self.f = DeepCombo{ opt1:null, opt2:null, nested: InnerCombo{i:42,b:true} };
    }
}
