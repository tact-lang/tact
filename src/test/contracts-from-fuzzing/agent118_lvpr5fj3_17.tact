struct LotsOfFlags {
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

contract ManyFlags {
    flags: LotsOfFlags;

    init() {
        self.flags = LotsOfFlags{
            a:true,b:false,c:true,d:false,e:true,f:true,g:false,h:true,i:false,j:true
        };
    }
}