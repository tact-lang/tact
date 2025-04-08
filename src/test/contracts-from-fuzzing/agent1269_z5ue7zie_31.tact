// create very wide struct with mixed fields
struct WideT {
    a: Int; b: Bool; c: String; d: Address;
    e: Int?; f: Bool?; g: String?; h: Address?;
    i: Int; j: Bool; k: String; l: Address;
    m: Int?; n: Bool?; o: String?; p: Address?;
}

contract TestContract {
    w: WideT;

    init() {
        self.w = WideT{
            a:1,b:true,c:"c",d:myAddress(),
            e:2,f:false,g:null,h:null,
            i:3,j:true,k:"k",l:myAddress(),
            m:null,n:true,o:"hello",p:null
        };
    }
}