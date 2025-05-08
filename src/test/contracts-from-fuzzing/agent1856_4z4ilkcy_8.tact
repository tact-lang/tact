struct Simple {
    val: Int;
}

contract Multi {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Simple;
    h: Simple?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "x";
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = Simple{val: 5};
        self.h = null;
    }
}