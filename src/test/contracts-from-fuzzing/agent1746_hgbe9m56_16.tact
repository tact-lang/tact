struct A {
    val: Int;
}

contract DefaultVals {
    s1: A = A{val:1};
    s2: A = A{val:2};
    s3: A = A{val:3};

    init() {
        self.s1 = A{val:10};
        self.s2 = A{val:20};
        self.s3 = A{val:30};
    }
}
