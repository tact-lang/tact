struct S1 { f1: Int; }
struct S2 { f2: Int; }

contract FieldOrderPersistence {
    a: Int;
    s2: S2;
    b: Bool;
    s1: S1;
    c: Int;

    init() {
        self.a = 1;
        self.s2 = S2{f2: 22};
        self.b = true;
        self.s1 = S1{f1: 11};
        self.c = 3;
    }
}