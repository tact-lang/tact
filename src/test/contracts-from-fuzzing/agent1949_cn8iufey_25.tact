struct Dup {
    x: Int;
}

contract TwoOptionDup {
    a: Dup?;
    b: Dup?;

    init() {
        self.a = null;
        self.b = null;
    }
}
