struct X {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
}

struct Y {
    x1: X;
    x2: X;
}

contract Test {
    y: Y;

    init() {
        self.y = Y{
            x1: X{a:1,b:true,c:"a",d:null,e:null,f:null},
            x2: X{a:2,b:false,c:"b",d:3,e:"xx",f:true},
        };
    }
}