struct ManyOpts {
    a: Bool?; b: Bool?; c: Bool?; d: Bool?; e: Bool?;
    f: Bool?; g: Bool?; h: Bool?; i: Bool?; j: Bool?;
    k: Bool?; l: Bool?; m: Bool?; n: Bool?; o: Bool?;
}

contract LotsOfOptionals {
    flags: ManyOpts;
    init() {
        self.flags = ManyOpts{
            a:null,b:true,c:null,d:true,e:null,
            f:true,g:null,h:true,i:null,j:true,
            k:null,l:true,m:null,n:true,o:null
        };
    }
}