struct Sub {
    a: Int;
    b: Int;
}

contract BigDefault {
    s1: Sub = Sub{ a: 1, b: 2 };
    s2: Sub = Sub{ a: 3, b: 4 };
    s3: Sub = Sub{ a: 5, b: 6 };
    s4: Sub = Sub{ a: 7, b: 8 };

    init() {
        self.s1 = Sub{ a: 10, b: 20 };
        self.s3 = Sub{ a: 30, b: 40 };
    }
}