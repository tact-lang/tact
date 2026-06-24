contract ChainDefaultsAndOptionals {
    a: Int = 1;
    b: Int?;
    c: Bool = true;
    d: Bool?;
    e: String = "hello";
    f: String?;

    init() {
        self.a=5; self.b=null;
        self.c=false; self.d=null;
        self.e="bye"; self.f=null;
    }
}