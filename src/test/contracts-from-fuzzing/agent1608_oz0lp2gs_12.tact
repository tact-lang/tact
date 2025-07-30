struct Wide {
    a: Int; b: Int; c: Int; d: Int; e: Int; f: Int; g: Int;
    h: Int; i: Int; j: Int; k: Int; l: Int; m: Int; n: Int;
    o: Int; p: Int; q: Int; r: Int; s: Int; t: Int;
    u: Int; v: Int; w: Int; x: Int; y: Int; z: Int;
}

contract WideStructStorage {
    val: Wide = Wide{
        a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,k:11,l:12,m:13,n:14,o:15,p:16,
        q:17,r:18,s:19,t:20,u:21,v:22,w:23,x:24,y:25,z:26
    };

    init() {
        self.val = Wide{
            a:101,b:102,c:103,d:104,e:105,f:106,g:107,h:108,i:109,j:110,k:111,l:112,m:113,n:114,o:115,p:116,
            q:117,r:118,s:119,t:120,u:121,v:122,w:123,x:124,y:125,z:126
        };
    }
}