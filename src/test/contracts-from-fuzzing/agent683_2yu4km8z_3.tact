contract LongFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Address;
    f: String;
    g: Bool;
    h: Int;
    i: Int?;
    j: String;
    k: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "str";
        self.d = null;
        self.e = myAddress();
        self.f = "another";
        self.g = false;
        self.h = 100;
        self.i = 5;
        self.j = "done";
        self.k = myAddress();
    }
}