contract LargeDefaults {
    a: Int = 10;
    b: Int = 20;
    c: Bool = false;
    d: String = "abc";
    e: Int? = null;
    f: Bool? = null;
    g: String? = null;
    init() {
        self.a=1; self.b=2; self.c=true; self.d="z";
        self.e=null; self.f=null; self.g=null;
    }
}