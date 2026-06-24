struct BigStruct {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
    g: Int;
    h: Bool;
}

contract MultiFields {
    f1: BigStruct;
    f2: BigStruct;
    f3: BigStruct;

    init() {
        self.f1 = BigStruct{ a:1,b:true,c:2,d:false,e:3,f:true,g:4,h:false };
        self.f2 = BigStruct{ a:5,b:false,c:6,d:true,e:7,f:false,g:8,h:true };
        self.f3 = BigStruct{ a:9,b:true,c:10,d:false,e:11,f:true,g:12,h:false };
    }
}