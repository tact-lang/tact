struct T {
 a: Int;
 b: Int;
 c: Int;
 d: Int;
 e: Int;
 f: Int;
 g: Int;
 h: Int;
 i: Int;
 j: Int;
}

contract VeryWide {
    val: T = T{
        a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10
    };

    init() {
        self.val = T{
            a:11,b:12,c:13,d:14,e:15,f:16,g:17,h:18,i:19,j:20
        };
    }
}