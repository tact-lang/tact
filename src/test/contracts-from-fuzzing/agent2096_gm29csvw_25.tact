struct Sub {
    a: Int;
}

contract ManySubs {
    s1: Sub;
    s2: Sub;
    s3: Sub;
    s4: Sub;
    s5: Sub;

    init() {
        self.s1 = Sub{a:1};
        self.s2 = Sub{a:2};
        self.s3 = Sub{a:3};
        self.s4 = Sub{a:4};
        self.s5 = Sub{a:5};
    }
}