contract MixedOptAndDef {
    a: Int = 1;
    b: Bool? = null;
    c: String = "str";
    d: Int? = 42;
    e: Bool = false;
    f: String? = null;

    init() {
        self.a=100;
        self.b=true;
        self.c="changed";
        self.d=null;
        self.e=true;
        self.f="optstr";
    }
}