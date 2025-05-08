struct S {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String;
    f: Bool?;
    g: Int;
    h: String;
}

contract ManyVars {
    s1: S;
    s2: S;

    init() {
        self.s1 = S{a:1,b:"a",c:true,d:null,e:"e",f:false,g:2,h:"h"};
        self.s2 = S{a:3,b:"b",c:false,d:4,e:"f",f:true,g:5,h:"j"};
    }
}