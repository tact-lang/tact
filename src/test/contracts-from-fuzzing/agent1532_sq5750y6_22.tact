struct L {
    a:Int;
    b:Int;
    c:Int;
    d:Int;
    e:Int;
    f:Int;
    g:Int;
    h:Int;
    i:Int;
    j:Int;
}

contract ManyVars {
    v1:L;
    v2:L;
    v3:L;
    v4:L;
    v5:L;

    init() {
        self.v1=L{a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10};
        self.v2=L{a:11,b:12,c:13,d:14,e:15,f:16,g:17,h:18,i:19,j:20};
        self.v3=L{a:21,b:22,c:23,d:24,e:25,f:26,g:27,h:28,i:29,j:30};
        self.v4=L{a:31,b:32,c:33,d:34,e:35,f:36,g:37,h:38,i:39,j:40};
        self.v5=L{a:41,b:42,c:43,d:44,e:45,f:46,g:47,h:48,i:49,j:50};
    }
}