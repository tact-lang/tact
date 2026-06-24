struct Child {
    val: Int;
}

contract ArrayLike {
    s1: Child;
    s2: Child;
    s3: Child;
    s4: Child;
    s5: Child;

    init() {
        self.s1 = Child{val: 1};
        self.s2 = Child{val: 2};
        self.s3 = Child{val: 3};
        self.s4 = Child{val: 4};
        self.s5 = Child{val: 5};
    }
}
