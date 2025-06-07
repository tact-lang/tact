// test many optional primitives together
contract TestContract {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;

    init() {
        self.a = null; self.b = 0; self.c = null; self.d = true; self.e = null; self.f = "f";
    }
}