struct SBool {
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
    s: SBool;

    init() {
        self.s = SBool{
            a:true,b:false,c:true,d:false,e:true,f:false,g:true,h:false,i:true,j:false
        };
    }
}