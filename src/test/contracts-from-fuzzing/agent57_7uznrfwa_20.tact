contract ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "c";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;

    init() {
        self.a=1;
        self.b=true;
        self.c="c";
        self.d=null;
        self.e=null;
        self.f=null;
    }
}