// Contract with many persistent fields (diverse types)
contract ManyFields {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.d = null;
        self.e = null;
        self.f = null;
    }
}
