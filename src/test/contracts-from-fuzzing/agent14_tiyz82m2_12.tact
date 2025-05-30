contract LargeMixed {
    a1: Int;
    a2: Bool;
    a3: String;
    b1: Int?;
    b2: Bool?;
    b3: String?;
    c1: Int;
    c2: Bool;
    c3: String;
    d1: Int?;
    d2: Bool?;
    d3: String?;
    
    init() {
        self.a1=1; self.a2=true; self.a3="a";
        self.b1=null; self.b2=false; self.b3=null;
        self.c1=3; self.c2=false; self.c3="c";
        self.d1=4; self.d2=null; self.d3="d";
    }
}