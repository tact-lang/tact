struct Large1 {
    a:Int; b:Int; c:Int; d:Int; e:Int; f:Int; g:Int; h:Int; i:Int; j:Int;
}

struct Large2 {
    k:Int; l:Int; m:Int; n:Int; o:Int; p:Int; q:Int; r:Int; s:Int; t:Int;
}

contract Test {
    s1:Large1;
    s2:Large2;

    init() {
        self.s1=Large1{a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10};
        self.s2=Large2{k:11,l:12,m:13,n:14,o:15,p:16,q:17,r:18,s:19,t:20};
    }
}
