struct LongFields {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
    k: Bool;
    l: Bool;
    m: Bool;
    n: Bool;
    o: String;
    p: String;
    q: String;
    r: String;
    s: String;
    t: String;
}

contract TestLong {
    data: LongFields;

    init() {
        self.data = LongFields{
            a: 1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,
            k:true,l:true,m:false,n:true,
            o:"o",p:"p",q:"q",r:"r",s:"s",t:"t"
        };
    }
}