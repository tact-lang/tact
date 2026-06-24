contract MixedTypesDefaults {
    i: Int = 1;
    b: Bool = true;
    s: String = "hello";
    oi: Int? = null;
    ob: Bool? = null;
    os: String? = null;

    init() {
        self.i=2; self.b=false; self.s="bye";
        self.oi=null; self.ob=null; self.os=null;
    }
}