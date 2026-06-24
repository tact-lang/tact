struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    x: String;
    y: Int?;
}

contract MultiStructs {
    f1: S1;
    f2: S2;

    init() {
        self.f1 = S1{a:313, b:true};
        self.f2 = S2{x:"y", y:null};
    }
}