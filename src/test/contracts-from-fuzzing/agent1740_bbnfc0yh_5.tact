struct Big {
    a: Int; b: Int; c: Int; d: Int; e: Int; f: Int;
    g: Int; h: Int; i: Int; j: Int; k: Int; l: Int;
    m: Int; n: Int; o: Int; p: Int; q: Int; r: Int;
    s: Int; t: Int; u: Int; v: Int; w: Int; x: Int;
    y: Int; z: Int;
}

contract Test {
    fields: Big = Big{
        a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,k:11,l:12,
        m:13,n:14,o:15,p:16,q:17,r:18,s:19,t:20,u:21,v:22,w:23,x:24,y:25,z:26
    };

    init() {
        self.fields = Big{
            a:26,b:25,c:24,d:23,e:22,f:21,g:20,h:19,i:18,j:17,k:16,l:15,
            m:14,n:13,o:12,p:11,q:10,r:9,s:8,t:7,u:6,v:5,w:4,x:3,y:2,z:1
        };
    }
}