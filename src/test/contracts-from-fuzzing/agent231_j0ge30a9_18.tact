struct VarA {
    flag: Bool;
    count: Int;
}
struct VarB {
    num: Int?;
    tag: Bool;
}

contract TwoFieldStructsPersist {
    a: VarA;
    b: VarB?;

    init() {
        self.a = VarA{ flag: true, count: 321 };
        self.b = null;
    }
}