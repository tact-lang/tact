struct Small {
    a: Int;
}

contract ManyTinyStructs {
    f1: Small;
    f2: Small;
    f3: Small;
    f4: Small;
    f5: Small;
    f6: Small;
    f7: Small;
    f8: Small;
    f9: Small;
    f10: Small;
    
    init() {
        self.f1 = Small{a:1};
        self.f2 = Small{a:2};
        self.f3 = Small{a:3};
        self.f4 = Small{a:4};
        self.f5 = Small{a:5};
        self.f6 = Small{a:6};
        self.f7 = Small{a:7};
        self.f8 = Small{a:8};
        self.f9 = Small{a:9};
        self.f10 = Small{a:10};
    }
}