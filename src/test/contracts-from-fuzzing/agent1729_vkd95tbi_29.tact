struct Looper {
    s1: Int;
    s2: Int;
    s3: Int;
    s4: Int;
    s5: Int;
}

contract ManySmallFields {
    f1: Looper; f2: Looper; f3: Looper; f4: Looper; f5: Looper;

    init() {
        self.f1 = Looper{s1:1,s2:2,s3:3,s4:4,s5:5};
        self.f2 = Looper{s1:1,s2:2,s3:3,s4:4,s5:5};
        self.f3 = Looper{s1:1,s2:2,s3:3,s4:4,s5:5};
        self.f4 = Looper{s1:1,s2:2,s3:3,s4:4,s5:5};
        self.f5 = Looper{s1:1,s2:2,s3:3,s4:4,s5:5};
    }
}