struct LongFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
    k: Bool;
    l: String;
    m: Int;
    n: Bool;
    o: String;
    p: Int;
    q: Bool;
    r: String;
    s: Int;
    t: Bool;
    u: String;
}

contract TestLong {
    val: LongFields;

    init() {
        self.val = LongFields{
            a:1,b:true,c:"x",d:2,e:false,f:"y",g:3,h:true,i:"z",j:4,k:false,l:"a",
            m:5,n:true,o:"b",p:6,q:false,r:"c",s:7,t:true,u:"d",
        };
    }
}