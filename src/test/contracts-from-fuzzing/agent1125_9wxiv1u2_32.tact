struct DeepLong {
    a: Int; b: Bool; c: Address; d: Int?; e: Bool?; f: Address?;
    g: Int; h: Bool; i: Address; j: Int?; k: Bool?; l: Address?;
    m: Int; n: Bool; o: Address; p: Int?; q: Bool?; r: Address?;
}

contract LoadsFields {
    dat: DeepLong;
    init() {
        self.dat = DeepLong{
          a:1,b:false,c:myAddress(),d:null,e:null,f:null,
          g:2,h:true,i:myAddress(),j:null,k:null,l:null,
          m:3,n:false,o:myAddress(),p:null,q:null,r:null
        };
    }
}