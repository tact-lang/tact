struct S {
    foo: Int;
}

contract TestContract {
    s1: S;
    s2: S;
    s3: S;
    s4: S;
    s5: S;

    init() {
        self.s1 = S{foo: 1};
        self.s2 = S{foo: 2};
        self.s3 = S{foo: 3};
        self.s4 = S{foo: 4};
        self.s5 = S{foo: 5};
    }
}