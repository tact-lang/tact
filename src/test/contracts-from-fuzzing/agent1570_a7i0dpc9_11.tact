contract InlineDefaultTest {
    a: Int = 1;
    b: Bool = true;
    c: Int? = null;
    d: String = "test";
    
    init() {
        self.a = 42;
        self.c = 99;
    }
}