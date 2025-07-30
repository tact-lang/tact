// test very many optional fields directly
contract BigOptals {
    a: Int?; b: Int?; c: Int?; d: Bool?; e: Bool?; f: Bool?;
    g: String?; h: String?; i: Cell?; j: Slice?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = null;
        self.i = null;
        self.j = null;
    }
}