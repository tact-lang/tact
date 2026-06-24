struct Mega {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Int;
    h: String;
    i: Bool;
    j: Int?;
    k: String?;
    l: Bool?;
    m: Int;
    n: String;
    o: Bool;
    p: Int?;
    q: String?;
    r: Bool?;
    s: Int;
    t: String;
}

contract TestContract {
    m: Mega;

    init() {
        self.m = Mega{
            a:1,b:"b",c:true,d:null,e:null,f:null,g:7,h:"h",i:false,j:null,k:null,l:null,m:0,n:"n",o:true,p:null,q:null,r:null,s:-1,t:"t"
        };
    }

    receive() {}
}