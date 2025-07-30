struct S {
    val: Int;
}

contract ArrayLike {
    s_0: S;
    s_1: S;
    s_2: S;
    s_3: S;
    s_4: S;

    init() {
        self.s_0 = S{val: 0};
        self.s_1 = S{val: 1};
        self.s_2 = S{val: 2};
        self.s_3 = S{val: 3};
        self.s_4 = S{val: 4};
    }
}