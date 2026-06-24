struct Inner {
    flag: Bool?;
}

contract ManyOptions {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Inner?;
    f: Inner;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = Inner{flag:null};
    }
}
