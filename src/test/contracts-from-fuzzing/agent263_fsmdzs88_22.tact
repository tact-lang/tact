contract LargeContract {
    a: Int; b: Bool; c: Address; d: Cell; e: Slice; f: String;
    g: Int; h: Bool; i: Address; j: Cell; k: Slice; l: String;
    m: Int; n: Bool; o: Address; p: Cell; q: Slice; r: String;
    s: Int; t: Bool; u: Address; v: Cell; w: Slice; x: String;
    y: Int; z: Bool;

    init() {
        self.a=1; self.b=true; self.c=myAddress(); self.d=emptyCell(); self.e=self.d.asSlice(); self.f="f";
        self.g=2; self.h=false; self.i=myAddress(); self.j=emptyCell(); self.k=self.j.asSlice(); self.l="l";
        self.m=3; self.n=true; self.o=myAddress(); self.p=emptyCell(); self.q=self.p.asSlice(); self.r="r";
        self.s=4; self.t=false; self.u=myAddress(); self.v=emptyCell(); self.w=self.v.asSlice(); self.x="x";
        self.y=5; self.z=true;
    }
}