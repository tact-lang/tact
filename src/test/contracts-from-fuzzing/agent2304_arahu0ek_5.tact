struct BigNested {
    a: Int;
    b: String;
    c: Bool;
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
}

contract HasBigStruct {
    state: BigNested;

    init() {
        self.state = BigNested{
            a:1,b:"",c:true,d:2,e:"",f:false,g:3,h:"",i:true,j:4,k:"",l:false,m:5,n:""
        };
    }
}