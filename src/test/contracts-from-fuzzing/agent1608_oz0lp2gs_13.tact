struct OptionalWide {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?; f: Int?; g: Int?;
    h: Int?; i: Int?; j: Int?; k: Int?; l: Int?; m: Int?; n: Int?;
    o: Int?; p: Int?; q: Int?; r: Int?; s: Int?; t: Int?;
    u: Int?; v: Int?; w: Int?; x: Int?; y: Int?; z: Int?;
}

contract OptWideStorage {
    val: OptionalWide = OptionalWide{
        a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null,
        k:null,l:null,m:null,n:null,o:null,p:null,q:null,r:null,s:null,t:null,
        u:null,v:null,w:null,x:null,y:null,z:null
    };

    init() {
        self.val = OptionalWide{
            a:1,b:null,c:3,d:null,e:5,f:null,g:7,h:null,i:9,j:null,
            k:11,l:null,m:13,n:null,o:15,p:null,q:17,r:null,s:19,t:null,
            u:21,v:null,w:23,x:null,y:25,z:null
        };
    }
}