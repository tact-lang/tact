struct Embedded {
    a: Int;
    b: String;
}

contract ManyEmbedded {
    e1: Embedded;
    e2: Embedded;
    e3: Embedded;
    e4: Embedded;

    init() {
        self.e1 = Embedded{ a:1, b:"a" };
        self.e2 = Embedded{ a:2, b:"b" };
        self.e3 = Embedded{ a:3, b:"c" };
        self.e4 = Embedded{ a:4, b:"d" };
    }
}