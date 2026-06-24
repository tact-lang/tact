contract ManyOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;

    init() {
        self.a = null; self.b = 2; self.c=true; self.d=null; self.e=null; self.f="f";
    }
}