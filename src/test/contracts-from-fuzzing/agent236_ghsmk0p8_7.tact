struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: String;
    f: Bool;
    g: Int;
    h: String;
    i: Bool;
    j: Int;
    k: String;
    l: Bool;
    m: Int;
    n: String;
    o: Bool;
    p: Int;
    q: String;
    r: Bool;
    s: Int;
    t: String;
}

contract TestContract {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a:1,b:true,c:"a",d:2,e:"e",f:false,g:3,h:"h",i:true,j:4,k:"k",l:false,m:5,n:"n",o:true,p:6,q:"q",r:false,s:7,t:"t"
        };
    }
}