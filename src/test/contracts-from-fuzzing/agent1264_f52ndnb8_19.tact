contract ManyPrimitiveTypes {
    i1: Int; 
    b1: Bool; 
    s1: String; 
    a1: Address; 
    c1: Cell; 
    sl1: Slice;

    init() {
        self.i1 = 1;
        self.b1 = true;
        self.s1 = "abc";
        self.a1 = myAddress();
        self.c1 = emptyCell();
        self.sl1 = emptyCell().asSlice();
    }
}