contract LongFlat {
    a1: Int; a2: Bool; a3: Bool?; a4: String; a5: String?;
    b1: Int; b2: Bool; b3: Bool?; b4: String; b5: String?;
    c1: Int; c2: Bool; c3: Bool?; c4: String; c5: String?;
    d1: Int; d2: Bool; d3: Bool?; d4: String; d5: String?;

    init() {
        self.a1=1; self.a2=true; self.a3=null; self.a4="a"; self.a5=null;
        self.b1=2; self.b2=false; self.b3=true; self.b4="b"; self.b5=null;
        self.c1=3; self.c2=true; self.c3=false; self.c4="c"; self.c5=null;
        self.d1=4; self.d2=false; self.d3=true; self.d4="d"; self.d5=null;
    }
}