struct BoolNest {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
}

contract ManyBools {
    f: BoolNest;

    init() {
        self.f = BoolNest{a:true,b:false,c:true,d:false,e:true};
    }
}
