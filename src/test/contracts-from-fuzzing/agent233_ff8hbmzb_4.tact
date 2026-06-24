contract ManyTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Int?;
    g: Bool?;
    h: String;
    i: Address;
    j: Cell;
    k: Int?;
    l: Bool;

    init() {
        self.a = 0;
        self.b = false;
        self.c = "";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = null;
        self.g = true;
        self.h = "test";
        self.i = myAddress();
        self.j = emptyCell();
        self.k = 123;
        self.l = true;
    }

    receive() {
        // just touch
        let _ = self.k;
    }
}