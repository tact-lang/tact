struct S {
    val: Int?;
}

contract OptionalStructFieldDefault {
    s: S = S{ val: null };

    init() {
        self.s = S{ val: 7 };
    }

    receive() {}
}