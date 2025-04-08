contract OptDefaultTest {
    a: Int?;
    b: Bool = false;
    c: String;
    d: String?;

    init() {
        self.a = null;
        self.b = true;
        self.c = "hi";
        self.d = null;
    }
}