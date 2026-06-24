struct BigInner {
    a: Int; b: Int; c: Int; d: Int; e: Int;
    f: Int; g: Int; h: Int; i: Int; j: Int;
}

struct Container {
    f1: BigInner;
    f2: BigInner;
    f3: BigInner;
}

contract ManyBigInners {
    data: Container;

    init() {
        self.data = Container{
            f1: BigInner{a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10},
            f2: BigInner{a:11,b:12,c:13,d:14,e:15,f:16,g:17,h:18,i:19,j:20},
            f3: BigInner{a:21,b:22,c:23,d:24,e:25,f:26,g:27,h:28,i:29,j:30}
        };
    }
}
