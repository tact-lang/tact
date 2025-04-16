struct S {
    a: Int?;
}

contract Holder {
    s: S;

    init() {
        self.s = S{ a: null };
    }
}