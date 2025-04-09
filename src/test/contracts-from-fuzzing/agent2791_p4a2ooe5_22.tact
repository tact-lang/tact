struct S1 {
    a: Int;
}

struct S2 {
    b: Bool;
}

contract ManyStructs {
    f1: S1;
    f2: S2;
    f3: S1;
    f4: S2;

    init() {
        self.f1 = S1{a:1};
        self.f2 = S2{b:true};
        self.f3 = S1{a:2};
        self.f4 = S2{b:false};
    }
}
