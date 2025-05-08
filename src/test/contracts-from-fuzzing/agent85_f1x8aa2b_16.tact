struct S {
    x: Int?;
}

contract OptionalInStructNoInit {
    s: S;

    init() {
        self.s = S{ x: null };
    }

    receive() {}
}