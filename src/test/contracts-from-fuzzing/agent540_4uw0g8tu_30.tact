struct S {
    a: Int;
    b: Int?;
}

contract OptionalLast {
    val: S;

    init() {
        self.val = S{ a: 13, b: null };
    }
}