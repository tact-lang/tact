contract FieldOrderTest {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int as uint4 = 15;
    e: Int?;
    f: Bool?;

    init() {
        self.e = null;
        self.f = true;
    }
}