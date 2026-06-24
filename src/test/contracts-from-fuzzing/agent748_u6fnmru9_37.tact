// Initialize several optional persistent fields only in init()
contract InitNulls {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        self.a = 2;
        self.b = false;
        self.c = "yeah";
    }
}