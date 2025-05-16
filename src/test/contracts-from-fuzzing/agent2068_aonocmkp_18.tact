struct Mega {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Bool;
    f: Bool?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: String?;
    l: Bool?;
    m: Int;
    n: Int;
}

contract Monster {
    payload: Mega;

    init() {
        self.payload = Mega {
            a:1,b:null,c:"z",d:null,e:true,f:null,g:7,h:false,i:"y",j:null,k:null,l:null,m:3,n:4
        };
    }
}