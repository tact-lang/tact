contract MixedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.a=2; self.b=true; self.c="hello";
        self.d=null; self.e=null; self.f=null;
    }
}