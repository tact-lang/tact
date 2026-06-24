contract ManyInitializersTest {
    a: Int;
    b: Int?;
    c: Bool;
    d: String?;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = "d";
    }
}