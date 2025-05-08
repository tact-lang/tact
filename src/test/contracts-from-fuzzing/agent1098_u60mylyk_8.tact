struct FieldOrderingA {
    a: Int;
    b: Bool;
    c: String;
}

struct FieldOrderingB {
    c: String;
    a: Int;
    b: Bool;
}

contract OrderingConflict {
    f1: FieldOrderingA;
    f2: FieldOrderingB;

    init() {
        self.f1 = FieldOrderingA{a:1,b:true,c:"hi"};
        self.f2 = FieldOrderingB{c:"hi",a:1,b:true};
    }
}
