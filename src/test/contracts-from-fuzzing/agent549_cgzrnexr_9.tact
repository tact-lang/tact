struct Prim {
    f1: Int;
    f2: Bool;
    f3: Int?;
}

contract ManyFields {
    a: Prim;
    b: Prim;
    c: Prim;
    d: Prim;
    e: Prim;
    f: Prim;
    g: Prim;
    h: Prim;
    i: Prim;
    j: Prim;

    init() {
        self.a = Prim{f1:1,f2:true,f3:null};
        self.b = Prim{f1:2,f2:true,f3:null};
        self.c = Prim{f1:3,f2:true,f3:null};
        self.d = Prim{f1:4,f2:true,f3:null};
        self.e = Prim{f1:5,f2:true,f3:null};
        self.f = Prim{f1:6,f2:true,f3:null};
        self.g = Prim{f1:7,f2:true,f3:null};
        self.h = Prim{f1:8,f2:true,f3:null};
        self.i = Prim{f1:9,f2:true,f3:null};
        self.j = Prim{f1:10,f2:true,f3:null};
    }

    receive() {
        self.a = Prim{f1:11,f2:false,f3:42};
    }
}