struct S {
    a: Int;
}

contract FieldReassign {
    s: S;

    init() {
        self.s = S{ a:1 };
        self.s = S{ a:2 };
    }
}