struct A {
    i: Int;
    b: Bool;
    s: String;
}

contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: A;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "test";
        self.d = null;
        self.e = null;
        self.f = A{ i: 10, b: true, s: "x" };
    }
}