struct InnerThick {
    a: Int; b: Int; c: Int; d: Int; e: Int; f: Int; g: Int; h: Int; i: Int; j: Int;
}

struct OuterThick {
    p: InnerThick;
    q: InnerThick;
    r: InnerThick;
    s: Int;
}

contract Thick {
    thick: OuterThick;

    init() {
        self.thick = OuterThick{
            p: InnerThick{ a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10 },
            q: InnerThick{ a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10 },
            r: InnerThick{ a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10 },
            s: 123
        };
    }
}