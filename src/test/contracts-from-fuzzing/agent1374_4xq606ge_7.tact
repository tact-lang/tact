contract TestContract {
    a: Int?; 
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Address?;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Slice?;
    j: Address?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "test";
        self.d = emptyCell().asSlice();
        self.e = myAddress();
        self.f = null;
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
    }
}