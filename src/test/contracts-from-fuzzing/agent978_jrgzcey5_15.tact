// contract with a very large struct with 20+ primitive & optional fields of different kinds
struct Large {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: String;
    h: String?;
    i: Int;
    j: Int?;
    k: Bool;
    l: Bool?;
    m: Address;
    n: Address?;
    o: String;
    p: String?;
    q: Int;
    r: Int?;
    s: Bool;
    t: Bool?;
}

contract LargeStructContract {
    big: Large;

    init() {
        self.big = Large{
            a:1,b:null,c:true,d:null,e:myAddress(),f:null,g:"g",h:null,i:2,j:null,
            k:false,l:null,m:myAddress(),n:null,o:"o",p:null,q:3,r:null,s:true,t:null
        };
    }
}