struct Inner {
    val1: Int;
    val2: Bool;
}

contract ManyInits {
    a: Int = 1;
    b: Bool = false;
    c: Int? = null;
    d: Bool? = null;
    e: Inner = Inner{val1: 1, val2: true};

    init() {
        self.a = 42;
        self.b = true;
        self.c = 7;
        self.d = true;
        self.e = Inner{val1: 99, val2: false};
    }
}