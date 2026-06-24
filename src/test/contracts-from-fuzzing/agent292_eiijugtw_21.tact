struct ManyBooleans {
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

contract BoolOverflow {
    flags: ManyBooleans;

    init() {
        self.flags = ManyBooleans{
            a:true,b:false,c:true,d:true,e:false,f:true,g:false,h:true,i:false,j:true
        };
    }
}