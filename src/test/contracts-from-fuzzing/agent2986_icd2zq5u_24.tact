// optional primitive fields directly on contract
contract OptPrimitives {
    i: Int?;
    b: Bool?;
    s: String?;

    init() {
        self.i = null;
        self.b = null;
        self.s = null;
    }
}