struct Big {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
    i: Int;
    j: Bool;
    k: String;
    l: Address;
    m: Int?;
    n: Bool?;
    o: String?;
    p: Address?;
}

contract BigStore {
    big: Big;

    init() {
        self.big = Big{
            a:1,b:true,c:"c",d:myAddress(),e:null,f:false,g:"g",h:null,
            i:2,j:false,k:"k",l:myAddress(),m:3,n:null,o:null,p:myAddress()
        };
    }

    receive() {}
}