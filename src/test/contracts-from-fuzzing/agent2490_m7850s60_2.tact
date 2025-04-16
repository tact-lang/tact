contract ManyFieldsTest {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool;
    e: String;
    f: String;
    g: Address;
    h: Address;

    init() {
        self.a = 0;
        self.b = 1;
        self.c = true;
        self.d = false;
        self.e = "hello";
        self.f = "world";
        self.g = myAddress();
        self.h = myAddress();
    }
}