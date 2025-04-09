contract LargePersistent {
    a: Int; b: Int; c: Int; d: Int; e: Int;
    f: Bool; g: Bool; h: Bool; i: Bool; j: Bool;
    k: String; l: String; m: String; n: String; o: String;
    p: Address; q: Address; r: Address; s: Address; t: Address;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4; self.e=5;
        self.f=true; self.g=false; self.h=true; self.i=false; self.j=true;
        self.k="k"; self.l="l"; self.m="m"; self.n="n"; self.o="o";
        self.p=myAddress(); self.q=myAddress(); self.r=myAddress(); self.s=myAddress(); self.t=myAddress();
    }
}
