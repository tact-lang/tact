// test large amount of mixed fields
contract Test39 {
    a: Int; b: Int?; c: Bool; d: Bool?; e: String; f: String?;
    g: Int; h: Int?; i: Bool; j: Bool?; k: String; l: String?;
    m: Int; n: Int?; o: Bool; p: Bool?; q: String; r: String?;

    init() {
        self.a=1; self.b=null; self.c=true; self.d=null; self.e="a"; self.f=null;
        self.g=2; self.h=2; self.i=false; self.j=true; self.k="b"; self.l=null;
        self.m=3; self.n=null; self.o=true; self.p=false; self.q="c"; self.r="zz";
    }
}