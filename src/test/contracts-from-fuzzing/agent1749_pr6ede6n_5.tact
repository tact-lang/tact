contract VariousTypes {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: String;
    
    init() {
        self.a = 42;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = "hello";
    }
}