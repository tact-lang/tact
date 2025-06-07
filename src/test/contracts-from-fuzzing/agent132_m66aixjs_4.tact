// Contract with many optional simple fields
contract ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: String?;

    init() {
        self.a = null;
        self.b = 1;
        self.c = null;
        self.d = true;
        self.e = null;
        self.f = "opt";
    }
}