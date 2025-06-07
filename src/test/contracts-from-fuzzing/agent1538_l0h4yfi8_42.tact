contract MixDefaults {
    a: Int = 1;
    b: Int;
    c: Bool = false;
    d: Bool;
    s: String = "def";
    t: String;

    init() {
        self.b = 2;
        self.d = true;
        self.t = "abc";
    }
}