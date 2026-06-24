struct Inner {
    value: Int;
    nested: InnerNested;
}

struct InnerNested {
    flag: Bool;
    s: String;
}

contract WideFields {
    f1: Inner;
    f2: Inner;
    f3: Inner;
    f4: Inner;
    f5: Inner;
    f6: Inner;
    f7: Inner;
    f8: Inner;
    f9: Inner;
    f10: Inner;
    
    init() {
        let val = Inner{
            value: 123,
            nested: InnerNested{ flag: false, s: "ok" }
        };
        self.f1 = val;
        self.f2 = val;
        self.f3 = val;
        self.f4 = val;
        self.f5 = val;
        self.f6 = val;
        self.f7 = val;
        self.f8 = val;
        self.f9 = val;
        self.f10 = val;
    }
}