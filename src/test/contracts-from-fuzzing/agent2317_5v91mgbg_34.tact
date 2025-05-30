struct S {
    v1: Int = 1;
    v2: Int = 2;
}

contract ReplaceDefault {
    s: S;

    init() {
        self.s = S{v1: 5, v2: 6};
    }
}