struct MultiBool {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
    i: Bool;
    j: Bool;
}

contract ManyBools {
    flags: MultiBool;

    init() {
        self.flags = MultiBool{
            a:false,b:true,c:false,d:true,e:false,
            f:true,g:false,h:true,i:false,j:true
        };
    }
}