struct ManyBools {
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

contract Flags {
    bits: ManyBools = ManyBools{
        a:false,b:false,c:false,d:false,e:false,f:false,g:false,h:false,i:false,j:false
    };

    init() {
        self.bits = ManyBools{
            a:true,b:true,c:true,d:true,e:true,f:true,g:true,h:true,i:true,j:true
        };
    }
}
