struct Embedded {
    flag: Bool;
}

contract TestContract {
    a: Int;
    b: Embedded;
    c: Int?;
    d: Embedded;

    init() {
        self.a = 1;
        self.b = Embedded{ flag: true };
        self.c = null;
        self.d = Embedded{ flag: false };
    }
}