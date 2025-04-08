contract LotOfSeparateFields {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Bool?;
    i: String?;
    j: Int;

    init() {
      self.a=1; self.b=null; self.c=true; self.d=false; self.e="a"; 
      self.f=null; self.g=2; self.h=null; self.i="b"; self.j=3;
    }
}
