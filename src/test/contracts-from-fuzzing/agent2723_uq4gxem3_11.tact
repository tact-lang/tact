struct S {
    n: Int;
}

contract OptField {
    s: S?;
    init() {
        self.s = S{ n: 5 };
    }
}