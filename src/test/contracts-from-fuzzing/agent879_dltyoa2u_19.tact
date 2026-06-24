contract SerializationTypes {
    a: Int as int32;
    b: Int as uint8;
    c: Int as coins;
    d: Bool;
    e: Address;
    f: String;
    g: Cell;
    h: Slice;
    
    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = true;
        self.e = myAddress();
        self.f = "hi";
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
    }
}
