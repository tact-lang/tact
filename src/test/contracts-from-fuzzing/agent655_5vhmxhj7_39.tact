// optional primitive fields initialized
contract InitOptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        self.a = 111;
        self.b = true;
        self.c = "hello";
    }
}