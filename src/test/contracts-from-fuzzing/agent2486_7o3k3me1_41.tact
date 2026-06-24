struct Huge {
    a:Int; b:Int; c:Int; d:Int; e:Int;
    f:Int; g:Int; h:Int; i:Int; j:Int;
    k:Int; l:Int; m:Int; n:Int; o:Int;
    p:Int; q:Int; r:Int; s:Int; t:Int;
}

contract MaxFields {
    field1:Huge = Huge{
        a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,
        k:11,l:12,m:13,n:14,o:15,p:16,q:17,r:18,s:19,t:20
    };
    field2:Huge = Huge{
        a:21,b:22,c:23,d:24,e:25,f:26,g:27,h:28,i:29,j:30,
        k:31,l:32,m:33,n:34,o:35,p:36,q:37,r:38,s:39,t:40
    };
}