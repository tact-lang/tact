struct LongStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: Bool;
    f: Int;
    g: Bool;
    h: Int;
    i: Bool;
    j: Int;
    k: Bool;
    l: Int;
    m: Bool;
    n: Int;
    o: Bool;
    p: Int;
    q: Bool;
    r: Int;
    s: Bool;
    t: Int;
}

contract ManyFields {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            a:1,b:2,c:3,d:true,e:false,f:4,g:false,h:5,i:true,j:6,
            k:false,l:7,m:true,n:8,o:false,p:9,q:true,r:10,s:false,t:11
        };
    }
}