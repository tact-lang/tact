struct MultipleBools {
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

contract PackedFlags {
    flags: MultipleBools;
    init() {
        self.flags = MultipleBools{
            a:true,b:false,c:true,d:false,e:true,f:false,g:true,h:false,i:true,j:false
        };
    }
}