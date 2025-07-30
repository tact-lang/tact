contract ManyFields {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: Bool = false;
    e: String = "abc";
    f: String = "def";
    h: Int = 42;
    i: Int = -42;
    j: Bool = false;

    init() {
        self.a = 100;
    }

    receive() {
        dump(self.h);
    }
}