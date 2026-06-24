struct S {
    val: Int;
}

contract Arranged {
    s2: S;
    s1: S;
    s4: S;
    s3: S;

    init() {
        self.s1 = S{val: 1};
        self.s2 = S{val: 2};
        self.s3 = S{val: 3};
        self.s4 = S{val: 4};
    }

    receive() {}
}