// optional contract fields with various primitive types
contract OptionalPrim {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Slice?;
    f: Cell?;

    init() {
        self.a = null;
        self.b = true;
        self.c = myAddress();
        self.d = "hi";
        self.e = emptyCell().asSlice();
        self.f = emptyCell();
    }
}
