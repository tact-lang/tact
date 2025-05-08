contract OptionalDefault {
    a: Int?;
    b: Int = 1;
    c: Int?;
    d: String = "hi";
    e: String?;
    f: Bool;
    g: Bool?;

    init() {
        self.a=null;
        self.c=null;
        self.e=null;
        self.f=true;
        self.g=null;
        self.b=100;
        self.d="hello";
    }
}
