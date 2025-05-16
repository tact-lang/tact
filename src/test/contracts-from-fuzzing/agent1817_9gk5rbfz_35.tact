// Compose large primitive-only struct
struct BigPrimitives {
    a: Int; b: Bool; c: Int;
    d: Bool; e: Int;
    f: Bool; g: Int;
    h: Bool; i: Int;
    j: Bool; k: Int;
    l: Bool; m: Int;
    n: Bool; o: Int;
    p: Bool; q: Int;
}

contract BigPrimitiveStruct {
    bp: BigPrimitives;

    init() {
        self.bp = BigPrimitives{
            a:1,b:true,c:2,d:false,e:3,f:true,g:4,h:true,i:5,j:false,k:6,
            l:false,m:7,n:true,o:8,p:false,q:9
        };
    }
}