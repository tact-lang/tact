struct S {
    x: Int;
}

contract DefaultsInInit {
    f: S;

    init() {
        self.f = S{x: 0};
    }
}