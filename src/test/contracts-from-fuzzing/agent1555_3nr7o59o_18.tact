contract OnlyBoolOpts {
    a: Bool?;
    b: Bool?;
    c: Bool?;
    d: Bool?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = false;
    }

    receive(){}
}