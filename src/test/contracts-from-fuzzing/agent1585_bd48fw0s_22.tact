struct BigOne {
    a: Int; b: Int; c: Int; d: Int; e: Int;
    f: Int; g: Int; h: Int; i: Int; j: Int;
    k: Int; l: Int; m: Int; n: Int; o: Int;
    p: Int; q: Int; r: Int; s: Int; t: Int;
    u: Int; v: Int; w: Int; x: Int; y: Int;
}

contract MultiStorage {
    s1: BigOne;
    s2: BigOne;

    init() {
        self.s1 = BigOne{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,
            k:11,l:12,m:13,n:14,o:15,p:16,q:17,r:18,s:19,t:20,
            u:21,v:22,w:23,x:24,y:25
        };
        self.s2 = BigOne{
            a:26,b:27,c:28,d:29,e:30,f:31,g:32,h:33,i:34,j:35,
            k:36,l:37,m:38,n:39,o:40,p:41,q:42,r:43,s:44,t:45,
            u:46,v:47,w:48,x:49,y:50
        };
    }
}