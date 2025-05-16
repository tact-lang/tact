struct Repeated {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

contract ManySameStruct {
    s1: Repeated;
    s2: Repeated;
    s3: Repeated;

    init() {
        self.s1 = Repeated{a:1,b:2,c:3,d:4,e:5};
        self.s2 = Repeated{a:6,b:7,c:8,d:9,e:10};
        self.s3 = Repeated{a:11,b:12,c:13,d:14,e:15};
    }
}