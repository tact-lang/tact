// persistent optional fields with non-null init assignment
contract TestContract {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
    g: Builder?;

    init() {
        self.a = 7;
        self.b = false;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "sample";
        self.g = beginCell();
    }
}