// multiple optional top level fields
contract TestContract {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = 5;
    }
}