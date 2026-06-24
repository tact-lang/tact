// Test top-level contract storage optional of primitive
contract TopOptPrim {
    a: Int?;
    b: Bool?;
    s: String?;

    init() {
        self.a = null;
        self.b = null;
        self.s = null;
    }
}