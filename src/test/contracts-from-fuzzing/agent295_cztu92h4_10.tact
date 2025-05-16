// Testing many Bool fields mixed with Int fields
contract ManyBools {
    a: Bool = true;
    b: Bool = false;
    c: Bool = true;
    d: Bool = false;
    e: Bool = true;
    f: Bool = false;
    x: Int = 123;

    init() {
        self.a = false;
        self.b = true;
        self.c = false;
        self.d = true;
        self.e = false;
        self.f = true;
        self.x = 456;
    }
    
    receive() {
        self.a = !self.a;
    }
}