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

contract DenseBits {
    data: ManyBools = ManyBools{
        a:true,b:false,c:true,d:false,e:true,f:false,g:true,h:false,i:true,j:false
    };
    init() {
        self.data = ManyBools{
            a:false,b:true,c:false,d:true,e:false,f:true,g:false,h:true,i:false,j:true
        };
    }
}
