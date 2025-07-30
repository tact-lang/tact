contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: Cell;
    e: Slice;
    f: String = "hello";
    g: Int? = null;
    
    init() {
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.a = 2;
        self.b = false;
        self.f = "world";
        self.g = 100;
    }
}