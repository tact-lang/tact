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

contract PackedBits {
    bits: ManyBools;
    init() {
        self.bits = ManyBools{
            a:true,b:false,c:true,d:true,e:false,f:true,g:false,h:true,i:true,j:false
        };
    }
}