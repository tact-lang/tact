struct S {
    bigStr: String;
    optInt: Int?;
    boolVal: Bool;
}

contract ManyStructFields {
    a: S;
    b: S;
    c: S;
    d: S;

    init() {
        self.a = S{bigStr:"a",optInt:null,boolVal:true};
        self.b = S{bigStr:"b",optInt:1,boolVal:false};
        self.c = S{bigStr:"c",optInt:null,boolVal:true};
        self.d = S{bigStr:"d",optInt:2,boolVal:false};
    }
}
