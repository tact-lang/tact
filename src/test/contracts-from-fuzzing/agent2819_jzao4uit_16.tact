struct Chain {
    a: Int;
    b: String;
    c: Int?;
    d: String?;
    e: Bool;
    f: Bool?;
}

contract TestContract {
    chain1: Chain;
    chain2: Chain;

    init() {
        self.chain1 = Chain{
            a:1,b:"b",c:2,d:null,e:true,f:null
        };
        self.chain2 = Chain{
            a:5,b:"c",c:null,d:"d",e:false,f:true
        };
    }
}