contract ManyInlineDefaults {
    i: Int = 1;
    b: Bool = true;
    s: String = "hi";
    oi: Int? = null;
    ob: Bool? = null;
    os: String? = null;
    
    init() {
        self.i=2; self.b=false; self.s="hello";
        self.oi=null; self.ob=null; self.os=null;
    }
}