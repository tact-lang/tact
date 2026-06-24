struct MassiveOptional {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Bool?; g: Bool?; h: Bool?; i: Bool?; j: Bool?;
    k: String?; l: String?; m: String?; n: String?; o: String?;
    p: InnerOpt?; q: InnerOpt?; r: InnerOpt?; s: InnerOpt?; t: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract MaxOptNested {
    big: MassiveOptional;

    init() {
        self.big = MassiveOptional{
            a:null,b:null,c:null,d:null,e:null,
            f:null,g:null,h:null,i:null,j:null,
            k:null,l:null,m:null,n:null,o:null,
            p:null,q:null,r:null,s:null,t:null
        };
    }
}