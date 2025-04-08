struct ManyFields {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
    g: Int;
    h: Bool;
    i: Int;
    j: Bool;
    k: Int;
    l: Bool;
    m: Int;
    n: Bool;
    o: Int;
}

contract TestContract {
    mf: ManyFields;

    init() {
        self.mf = ManyFields{
            a:1,b:true,c:2,d:false,e:3,f:true,g:4,h:false,i:5,j:true,k:6,l:false,m:7,n:true,o:8
        };
    }
}