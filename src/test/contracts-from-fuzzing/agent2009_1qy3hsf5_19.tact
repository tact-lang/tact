contract OptWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Int = 0;
    e: Bool = false;
    f: String = "";
    init() {
        self.a=null; self.b=null; self.c=null;
        self.d=1; self.e=true; self.f="test";
    }
}