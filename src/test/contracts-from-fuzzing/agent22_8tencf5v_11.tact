// Test large contract: many direct persistent fields of primitive types
contract LargePrimitives {
    a: Int; b: Bool; c: String;
    d: Int; e: Bool; f: String;
    g: Int; h: Bool; i: String;
    j: Int; k: Bool; l: String;
    m: Int; n: Bool; o: String;
    p: Int; q: Bool; r: String;
    s: Int; t: Bool; u: String;
    v: Int; w: Bool; x: String;
    y: Int; z: Bool;

    init() {
        self.a=1; self.b=true; self.c="c";
        self.d=2; self.e=false; self.f="f";
        self.g=3; self.h=true; self.i="i";
        self.j=4; self.k=false; self.l="l";
        self.m=5; self.n=true; self.o="o";
        self.p=6; self.q=false; self.r="r";
        self.s=7; self.t=true; self.u="u";
        self.v=8; self.w=false; self.x="x";
        self.y=9; self.z=true;
    }
}