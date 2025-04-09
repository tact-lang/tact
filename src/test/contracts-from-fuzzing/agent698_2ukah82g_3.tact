struct Tiny {
    value: Int;
}

contract TestContract {
    a: Int;
    b: Bool;
    c: Tiny;
    d: Int?;
    e: Bool?;
    f: Tiny;

    init() {
        self.a = 1;
        self.b = true;
        self.c = Tiny{ value: 5 };
        self.d = null;
        self.e = false;
        self.f = Tiny{ value: 10 };
    }
}