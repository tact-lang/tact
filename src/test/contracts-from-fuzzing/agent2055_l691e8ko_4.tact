struct S1 {
    a: Int;
}

struct S2 {
    b: Bool;
}

struct S3 {
    c: String;
}

contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: S1;
    f5: S2;
    f6: S3;
    f7: Int;
    f8: Bool;
    f9: String;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "hello";
        self.f4 = S1{a:2};
        self.f5 = S2{b:false};
        self.f6 = S3{c:"bye"};
        self.f7 = 7;
        self.f8 = false;
        self.f9 = "z";
    }
}
