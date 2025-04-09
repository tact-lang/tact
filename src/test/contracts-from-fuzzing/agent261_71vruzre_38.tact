contract MixedOptions {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    s: String;
    t: String?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.s = "text";
        self.t = null;
    }

    receive() {
        let _ = self.a + (self.b != null ? self.b!! : 0);
    }
}