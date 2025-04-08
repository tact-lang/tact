struct Dup {
    a: Int;
    b: Bool;
}

contract SameStructs {
    f1: Dup;
    f2: Dup;
    init() {
        self.f1 = Dup{ a:1, b:true };
        self.f2 = Dup{ a:2, b:false };
    }
}