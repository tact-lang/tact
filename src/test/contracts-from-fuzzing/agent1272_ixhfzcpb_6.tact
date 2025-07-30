contract FieldsNoDefaults {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
    g: Int?;
    h: String?;
    
    init() {
        self.a = 2;
        self.b = false;
        self.c = "bye";
        self.d = myAddress();
        self.e = emptyCell().asSlice();
        self.f = emptyCell();
        self.g = null;
        self.h = null;
    }
}
