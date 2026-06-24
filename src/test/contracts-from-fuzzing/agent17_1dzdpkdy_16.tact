struct Nested {
    n: Int as uint4;
    flag: Bool?;
}

contract TestContract {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Nested;
    h: Nested?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = "foo";
        self.f = null;
        self.g = Nested{ n: 5, flag: null };
        self.h = null;
    }
}