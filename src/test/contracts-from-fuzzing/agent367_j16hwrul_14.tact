struct SOptOpt {
    x: Int?;
    y: String?;
}

contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: SOptOpt;
    e: SOptOpt?;
    f: Bool?;
    g: String?;
    h: Int?;
    i: Bool;
    j: Int;

    init() {
        self.a=1;
        self.b=true;
        self.c="c";
        self.d=SOptOpt{x:null,y:null};
        self.e=null;
        self.f=null;
        self.g=null;
        self.h=null;
        self.i=false;
        self.j=10;
    }
}