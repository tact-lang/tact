struct BigNest {
 a: Int;
 b: String;
 c: Bool;
 d: Address;
 e: Int?;
 f: String?;
 g: Bool?;
 h: Address?;
}

struct OuterNest {
    n1: BigNest;
    n2: BigNest;
}

contract LotsOfOptions {
    val: OuterNest;

    init() {
        self.val = OuterNest{
            n1: BigNest{a:1,b:"a",c:true,d:myAddress(),e:null,f:null,g:true,h:null},
            n2: BigNest{a:2,b:"b",c:false,d:myAddress(),e:5,f:"hi",g:null,h:myAddress()}
        };
    }
}