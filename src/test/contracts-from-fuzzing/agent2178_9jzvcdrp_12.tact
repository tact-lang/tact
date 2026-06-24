struct Embed {
    x: Int;
    y: Int?;
}

contract ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Embed?;
    e: Embed?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}