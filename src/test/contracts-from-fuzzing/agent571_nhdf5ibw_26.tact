struct S {
    p: Int;
    q: Bool;
}

contract TestContract {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Address?;
    f: Cell?;
    g: S?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = null;
    }
}