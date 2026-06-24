struct WideOptBool {
    a: Bool?; b: Bool?; c: Bool?; d: Bool?; e: Bool?;
    f: Bool?; g: Bool?; h: Bool?; i: Bool?; j: Bool?;
    k: Bool?; l: Bool?; m: Bool?; n: Bool?; o: Bool?;
    p: Bool?; q: Bool?; r: Bool?; s: Bool?; t: Bool?;
}

contract WideOptBoolStorage {
    val: WideOptBool;

    init() {
        self.val = WideOptBool{
            a:true,b:null,c:false,d:null,e:true,f:null,g:false,h:null,i:true,j:null,
            k:false,l:null,m:true,n:null,o:false,p:null,q:true,r:null,s:false,t:null
        };
    }
}