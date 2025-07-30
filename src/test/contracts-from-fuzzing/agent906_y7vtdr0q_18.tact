struct TwoStructs {
    f1: Int;
    f2: Int;
}

contract ManyFields {
    s1: TwoStructs;
    s2: TwoStructs;
    s3: TwoStructs;
    s4: TwoStructs;
    s5: TwoStructs;

    init() {
        self.s1 = TwoStructs{f1:1,f2:2};
        self.s2 = TwoStructs{f1:3,f2:4};
        self.s3 = TwoStructs{f1:5,f2:6};
        self.s4 = TwoStructs{f1:7,f2:8};
        self.s5 = TwoStructs{f1:9,f2:10};
    }
}