// stress test many bool and optional fields
contract TestContract {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
    e: Bool;
    f: Bool?;
    g: Bool;
    h: Bool?;
    i: Bool;
    j: Bool?;
    k: Bool;
    l: Bool?;
    m: Bool;
    n: Bool?;

    init() {
        self.a=true;self.b=null;self.c=false;self.d=true;
        self.e=false;self.f=null;self.g=true;self.h=false;
        self.i=true;self.j=null;self.k=false;self.l=null;
        self.m=true;self.n=false;
    }

    receive() {
        self.a=false;self.b=true;self.c=true;self.d=null;
        self.e=true;self.f=false;self.g=false;self.h=null;
        self.i=false;self.j=true;self.k=true;self.l=false;
        self.m=false;self.n=null;
    }
}