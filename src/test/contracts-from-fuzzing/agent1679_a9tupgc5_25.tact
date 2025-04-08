struct S {
    a: Int?;
}

contract OptionalStructInInit {
    x: S;

    init() {
        self.x = S{ a: null };
    }

    receive() {}
}