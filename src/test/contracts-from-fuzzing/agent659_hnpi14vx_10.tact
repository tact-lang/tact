contract TestContract {
    a: Int;
    b: Bool?;
    c: Address?;
    d: String;
    e: Slice?;
    f: Builder;
    g: Cell?;
    h: Bool;
    i: Address;
    j: String?;
    k: Int?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = null;
        self.d = "text";
        self.e = null;
        self.f = beginCell();
        self.g = null;
        self.h = true;
        self.i = myAddress();
        self.j = null;
        self.k = null;
    }
}