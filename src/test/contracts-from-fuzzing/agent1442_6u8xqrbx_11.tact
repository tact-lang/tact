// Fuzz test optional string, int, bool fields together
contract TestContract {
    a: String?;
    b: Int?;
    c: Bool?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}