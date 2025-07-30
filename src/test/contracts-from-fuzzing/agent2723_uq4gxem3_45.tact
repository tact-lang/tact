struct AAA {
    x: Int;
}

contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Int?;
    f: Bool?;
    g: Address?;
    h: String?;
    aa: AAA;
    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = "hi";
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = null;
        self.aa = AAA{ x: 100 };
    }
}