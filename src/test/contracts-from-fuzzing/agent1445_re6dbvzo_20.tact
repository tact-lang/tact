contract LotsOfNestedNullable{
    a: Int?;
    b: String?;
    c: Bool?;
    d: Slice?;
    e: Address?;

    init() {
        self.a = null;
        self.b = "test";
        self.c = null;
        self.d = emptyCell().asSlice();
        self.e = null;
    }
}