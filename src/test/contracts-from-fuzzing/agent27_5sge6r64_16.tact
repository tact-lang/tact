// Long list of persistent fields with multiple types
contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Address;
    h: Cell;
    i: Int;
    j: Bool;
    k: String;
    l: Address;
    m: Cell;
    n: Bool?;
    o: Int?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "one";
        self.d = null;
        self.e = null;
        self.f = "two";
        self.g = myAddress();
        self.h = emptyCell();
        self.i = 10;
        self.j = true;
        self.k = "three";
        self.l = myAddress();
        self.m = emptyCell();
        self.n = null;
        self.o = null;
    }
}
