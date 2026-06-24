contract TestContract {
    a: Int;
    b: Bool;
    c: String;

    init() {
        self.a = 10;
        self.b = true;
        self.c = "abc";
    }

    get fun read(): String {
        if (self.b) {
            return self.c;
        } else {
            return "no";
        }
    }
}