contract ManyFieldsContract {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: String;
    f: Int?;
    g: Bool?;
    h: Address?;
    i: Cell;
    j: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = "hello";
        self.f = null;
        self.g = false;
        self.h = null;
        self.i = emptyCell();
        self.j = "bye";
    }
}