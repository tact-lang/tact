struct Wrap {
    a: Int;
    b: Int;
    c: Int;
}

contract ManyVars {
    w1: Wrap;
    w2: Wrap;
    w3: Wrap;
    w4: Wrap;
    w5: Wrap;

    init() {
        self.w1 = Wrap{a:1,b:2,c:3};
        self.w2 = Wrap{a:4,b:5,c:6};
        self.w3 = Wrap{a:7,b:8,c:9};
        self.w4 = Wrap{a:10,b:11,c:12};
        self.w5 = Wrap{a:13,b:14,c:15};
    }
}