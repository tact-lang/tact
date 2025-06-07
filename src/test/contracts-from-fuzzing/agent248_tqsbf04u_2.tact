contract WideStorageTest {
    a: Int;
    b: Bool;
    c: String;
    d: Int as uint8;
    e: Bool;
    f: String;
    g: Int;
    h: Bool = true;
    
    init() {
        self.a = 1;
        self.b = false;
        self.c = "one";
        self.d = 255;
        self.e = true;
        self.f = "two";
        self.g = -12345;
        self.h = false;
    }
}