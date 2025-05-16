struct S {
    flag: Bool;
}

contract BoolDefault {
    s: S = S{flag: false};

    init() {
        self.s = S{flag: true};
    }
}