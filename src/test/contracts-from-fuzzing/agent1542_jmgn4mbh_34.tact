struct Wide {
    a: Int;
    b: Bool;
    c: String?;
    d: Address?;
    e: Int as uint32;
    f: Bool?;
    g: String;
    h: Address;
    i: Int?;
    j: Bool;
    k: String?;
    l: Address?;
}

contract Test {
    data: Wide;

    init() {
        self.data = Wide{
            a:1,b:true,c:null,d:null,e:100,f:null,g:"hi",h:myAddress(),i:null,j:false,k:null,l:null
        };
    }
}