struct InnerMost {
    val: Int;
}

contract ListMany {
    f1: InnerMost;
    f2: InnerMost;
    f3: InnerMost;
    f4: InnerMost;
    f5: InnerMost;
    f6: InnerMost;
    f7: InnerMost;
    f8: InnerMost;
    f9: InnerMost;
    f10: InnerMost;
    
    init() {
        self.f1 = InnerMost{val:1};
        self.f2 = InnerMost{val:2};
        self.f3 = InnerMost{val:3};
        self.f4 = InnerMost{val:4};
        self.f5 = InnerMost{val:5};
        self.f6 = InnerMost{val:6};
        self.f7 = InnerMost{val:7};
        self.f8 = InnerMost{val:8};
        self.f9 = InnerMost{val:9};
        self.f10 = InnerMost{val:10};
    }
}
