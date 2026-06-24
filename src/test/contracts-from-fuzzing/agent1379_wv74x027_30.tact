struct Repeated {
    x: Int;
}

contract ManySameStructFields {
    a: Repeated;
    b: Repeated;
    c: Repeated;
    d: Repeated;

    init() {
        self.a = Repeated{x:1};
        self.b = Repeated{x:2};
        self.c = Repeated{x:3};
        self.d = Repeated{x:4};
    }
}
