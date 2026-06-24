contract Test {
    a: Int = 0;
    b: Int? = null;
    c: Bool = false;
    d: Bool? = null;
    e: Cell;
    f: Address;
    g: String = "test";
    h: String? = null;
    
    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = false;
        self.e = emptyCell();
        self.f = myAddress();
        self.g = "done";
        self.h = null;
    }
}