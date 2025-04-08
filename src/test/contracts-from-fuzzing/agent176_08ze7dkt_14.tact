contract VariantTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Int as uint40;
    e: Int?;
    f: Bool?;
    g: String?;
    
    init() {
        self.a=10; self.b=true; self.c="t"; self.d=5;
        self.e=null; self.f=null; self.g=null;
    }
}