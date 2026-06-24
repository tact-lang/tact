struct S1 {
    i: Int;
    b: Bool;
}

contract ManyFields {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: String;
    f5: S1;
    f6: S1;
    f7: String;
    f8: Bool;
    f9: Int;
    f10: String;

    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = true;
        self.f4 = "a";
        self.f5 = S1{i:5, b:true};
        self.f6 = S1{i:6, b:false};
        self.f7 = "b";
        self.f8 = false;
        self.f9 = 9;
        self.f10 = "c";
    }
}