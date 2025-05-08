// contract with a huge flat amount of fields incl opt/primitives
contract TestContract {
    a: Int; b: Bool; c: Int?; d: Bool?; e: Int; f: Bool; g: Int?; h: Bool?;
    i: Int; j: Bool; k: Int?; l: Bool?; m: Int; n: Bool; o: Int?; p: Bool?;
    q: Int; r: Bool; s: Int?; t: Bool?; u: Int; v: Bool; w: Int?; x: Bool?;

    init() {
        self.a=1; self.b=true; self.c=null; self.d=false; self.e=2; self.f=false; self.g=3; self.h=true;
        self.i=4; self.j=false; self.k=5; self.l=null; self.m=6; self.n=true; self.o=7; self.p=false;
        self.q=8; self.r=true; self.s=9; self.t=null; self.u=10; self.v=false; self.w=11; self.x=true;
    }

    receive() {
        self.a=11; self.b=false; self.c=12; self.d=null; self.e=21; self.f=true; self.g=31; self.h=false;
        self.i=41; self.j=true; self.k=51; self.l=false; self.m=61; self.n=false; self.o=71; self.p=true;
        self.q=81; self.r=false; self.s=91; self.t=true; self.u=101; self.v=true; self.w=111; self.x=false;
    }
}