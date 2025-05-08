contract InitializerTest {
    a: Int;
    b: String;
    c: Bool;
    init() {
        self.a = 42;
        self.b = "init";
        self.c = true;
    }
}