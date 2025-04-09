// Contract with many optional primitive fields directly as contract vars
contract ManyOptionalFields {
    a: Int?;
    b: Bool?;
    c: Slice?;
    d: Cell?;
    e: Builder?;
    f: Address?;
    g: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = null;
    }
}