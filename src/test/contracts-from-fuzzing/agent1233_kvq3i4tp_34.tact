struct S {
    a: Int;
}

contract DefaultInit {
    s: S;

    init() {
        self.s = S{a:0};
    }
}