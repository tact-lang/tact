contract LargeContract {
    a: Int;
    b: Int?;
    c: Bool = false;
    d: String;
    e: String = "hi";
    f: Address;
    g: Bool;
    h: Int?;
    i: String;
    j: Bool;

    init() {
        self.a = 1;
        self.b = null;
        self.d = "hello";
        self.f = myAddress();
        self.g = true;
        self.h = null;
        self.i = "bye";
        self.j = false;
    }
}