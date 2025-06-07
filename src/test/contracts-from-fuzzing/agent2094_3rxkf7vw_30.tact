struct S {
    msg: String?;
}

contract OptStringInit {
    s: S;
    init() {
        self.s = S{ msg: null };
    }
    receive() {}
}
