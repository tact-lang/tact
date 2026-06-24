contract MixDefaultsAndNoDefaults {
    a: Int;
    b: Int = 123;
    c: Bool;
    d: Bool = false;
    e: String;
    f: String = "ok";

    init() {
        self.a = 1;
        self.c = true;
        self.e = "x";
    }
}