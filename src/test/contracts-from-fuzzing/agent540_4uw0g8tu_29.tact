struct S {
    a: Int?;
    b: Int;
}

contract OptionalFirst {
    val: S;

    init() {
        self.val = S{ a: null, b: 13 };
    }
}