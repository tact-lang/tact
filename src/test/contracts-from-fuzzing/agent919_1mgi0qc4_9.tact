// very long list of persistent primitives
contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Bool?;
    g: Int?;
    h: String;
    i: Address;
    j: Cell;
    
    init() {
        self.a = 1;
        self.b = true;
        self.c = "hello";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = null;
        self.g = null;
        self.h = "world";
        self.i = myAddress();
        self.j = emptyCell();
    }
}