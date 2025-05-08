struct S {
    a: Int;
    b: Bool;
}

contract MultiStructs {
    f1: S;
    f2: S;
    f3: S;
    init() {
        self.f1 = S{a:1,b:true};
        self.f2 = S{a:2,b:false};
        self.f3 = S{a:3,b:true};
    }
}