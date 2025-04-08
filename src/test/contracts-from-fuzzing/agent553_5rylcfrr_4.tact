struct Deep {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

contract ManyFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    s: Deep;

    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = 3;
        self.f4 = 4;
        self.f5 = 5;
        self.s = Deep{a: 6, b:7, c:8, d:9, e:10};
    }
}