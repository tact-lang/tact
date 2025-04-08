// test contract with ONLY optional storage fields
contract AllOptionalFields {
    x: Int?;
    y: Bool?;
    s: String?;
    b: Bool?;
    n: Int?;
    t: String?;

    init() {
        self.x = null;
        self.y = null;
        self.s = "hi";
        self.b = true;
        self.n = null;
        self.t = null;
    }
}