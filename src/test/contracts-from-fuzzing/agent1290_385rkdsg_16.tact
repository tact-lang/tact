// Serialize many optional + mixed fields
contract OptionalMix {
    a: Int?;
    b: String?;
    c: Bool;
    d: Int;
    e: String;
    f: Int?;
    g: Bool;
    h: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = true;
        self.d = 42;
        self.e = "hello";
        self.f = null;
        self.g = false;
        self.h = null;
    }

    receive() {
        self.a = 123;
        self.b = "test";
        self.c = false;
        self.d = 5;
        self.e = "bye";
        self.f = 777;
        self.g = true;
        self.h = "done";
    }
}