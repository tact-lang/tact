// Contract with only optional fields, none initialized explicitly
contract AllNullable {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}
