struct S {
    a: Int;
    b: Bool;
}

contract ManyVars {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: Cell;
    f: Address;
    g: S;
    init() {
        self.a = 1;
        self.b = false;
        self.c = null;
        self.d = "foo";
        self.e = emptyCell();
        self.f = myAddress();
        self.g = S{ a:42, b:true };
    }
}