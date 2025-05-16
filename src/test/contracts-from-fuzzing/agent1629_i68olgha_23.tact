contract ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "a";
    d: Int = 2;
    e: Bool = false;
    f: String = "b";

    init() {
        self.a=11;self.b=false;self.c="x";
        self.d=22;self.e=true;self.f="y";
    }
}