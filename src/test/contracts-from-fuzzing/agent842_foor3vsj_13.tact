contract LongPrimitiveList {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String?;

    init() {
        self.a=1; self.b=true; self.c="a"; self.d=null; self.e=null; self.f=null;
        self.g=2; self.h=false; self.i="b"; self.j=null; self.k=true; self.l="hi";
    }

    receive() {
        let _=self.a+self.g;
    }
}