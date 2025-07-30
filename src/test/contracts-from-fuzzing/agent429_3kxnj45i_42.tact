trait T1 {
    a: Int;
}

trait T2 {
    b: Bool;
}

contract MultiTraitInherit with T1, T2 {
    a: Int;
    b: Bool;
    init() {
        self.a = 1;
        self.b = false;
    }
}
