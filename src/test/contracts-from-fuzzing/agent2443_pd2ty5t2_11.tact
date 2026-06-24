// Mixed optional and non-optional fields in odd order
contract TestContract {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: Address?;

    init() {
        self.a = 0;
        self.b = null;
        self.c = "x";
        self.d = null;
        self.e = true;
        self.f = null;
    }
}