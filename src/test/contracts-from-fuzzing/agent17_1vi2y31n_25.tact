contract MixedFieldLayouts {
    a: Int;
    b: Bool = false;
    c: String;
    d: Int = 10;
    e: Bool;
    f: String = "abc";

    init() {
        self.a = 1;
        self.c = "x";
        self.e = true;
    }
}