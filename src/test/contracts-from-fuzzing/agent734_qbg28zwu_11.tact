struct Wide {
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
    l: Bool?;
    m: String?;
    n: String;
    o: Bool;
    p: Int?;
    q: Int;
}

contract TestContract {
    data: Wide;

    init() {
        self.data = Wide{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,k:true,l:null,m:null,n:"hi",o:false,p:null,q:11
        };
    }
}