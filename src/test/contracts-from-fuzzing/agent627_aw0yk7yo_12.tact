// contract with many persistent optional fields of different types
contract TestContract {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    cl: Cell?;
    sl: Slice?;

    init() {
        self.i = 10;
        self.b = null;
        self.s = "hello";
        self.a = null;
        self.cl = emptyCell();
        self.sl = null;
    }
}