struct A {
    flag: Bool;
}

contract ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Bool = false;
    e: Bool = true;
    f: String = "abc";
    nest: A = A{flag: true};

    init() {
        self.a = 10;
        self.b = 11;
        self.c = 12;
        self.d = true;
        self.e = false;
        self.f = "zzz";
        self.nest = A{flag: false};
    }
}
