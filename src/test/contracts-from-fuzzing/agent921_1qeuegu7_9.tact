contract MixedSerialization {
    a: Int as uint64;
    b: Int as int8;
    c: Bool;
    d: Address;
    e: Cell;
    f: Slice;
    g: String;
    
    init() {
        self.a = 123;
        self.b = -5;
        self.c = true;
        self.d = myAddress();
        self.e = emptyCell();
        self.f = self.e.asSlice();
        self.g = "Hello";
    }
}