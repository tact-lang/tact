struct S {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
}

contract MultiOptionals {
    val: S;

    init() {
        self.val = S{ a: null, b: null, c: null, d: null };
    }
}