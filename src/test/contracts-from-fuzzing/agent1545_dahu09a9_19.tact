struct Deep {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
}

contract ManyContractFields {
    s1: Deep;
    s2: Deep;

    init() {
        self.s1 = Deep{ a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8 };
        self.s2 = Deep{ a:9,b:10,c:11,d:12,e:13,f:14,g:15,h:16 };
    }
}
