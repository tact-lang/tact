struct BigOptionals {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Int?; g: Int?; h: Int?; i: Int?; j: Int?;
    k: Int?; l: Int?; m: Int?; n: Int?; o: Int?;
    p: Int?; q: Int?; r: Int?; s: Int?; t: Int?;
}

contract BigOptStruct {
    data: BigOptionals;

    init() {
        self.data = BigOptionals{
            a:1,b:null,c:3,d:null,e:5,
            f:null,g:7,h:null,i:9,j:null,
            k:11,l:null,m:13,n:null,o:15,
            p:null,q:17,r:null,s:19,t:null
        };
    }
}
