struct Sub {
    a: Int;
    b: Bool;
    c: String;
}

contract ManyVars {
    s1: Sub;
    s2: Sub;
    s3: Sub;
    s4: Sub;

    init() {
        self.s1 = Sub{a: 1, b: true, c: "1"};
        self.s2 = Sub{a: 2, b: false, c: "2"};
        self.s3 = Sub{a: 3, b: true, c: "3"};
        self.s4 = Sub{a: 4, b: false, c: "4"};
    }
}
