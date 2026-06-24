contract DefaultsTest {
    a: Bool = true;
    b: Int = 123;
    c: String = "abc";
    d: Bool? = null;
    e: Int? = null;
    f: String? = null;
    
    receive() {
        self.a = false;
        self.b = 0;
        self.c = "";
        self.d = null;
        self.e = null;
        self.f = null;
    }
}