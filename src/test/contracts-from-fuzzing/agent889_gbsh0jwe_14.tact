struct BigNest {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

contract MultipleBigs {
    b1: BigNest;
    b2: BigNest;
    b3: BigNest;

    init() {
        self.b1 = BigNest{a:1,b:2,c:3,d:4,e:5};
        self.b2 = BigNest{a:6,b:7,c:8,d:9,e:10};
        self.b3 = BigNest{a:11,b:12,c:13,d:14,e:15};
    }
}