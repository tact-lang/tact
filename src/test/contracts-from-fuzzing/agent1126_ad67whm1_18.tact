contract DefaultsTest {
    a: Int = 7;
    b: Bool = true;
    c: Int?; // optional defaults to null
    d: Bool?; // optional defaults to null
    
    init() {
        self.a = 42;
        self.b = false;
        self.c = 100;
        self.d = null;
    }
}