struct IntNest {
    x: Int;
    y: Int;
}

contract LargeNestedArray {
    a: IntNest;
    b: IntNest;
    c: IntNest;
    d: IntNest;
    e: IntNest;
    f: IntNest;
    g: IntNest;
    h: IntNest;
    i: IntNest;
    j: IntNest;

    init() {
        self.a = IntNest{x:1,y:2};
        self.b = IntNest{x:3,y:4};
        self.c = IntNest{x:5,y:6};
        self.d = IntNest{x:7,y:8};
        self.e = IntNest{x:9,y:10};
        self.f = IntNest{x:11,y:12};
        self.g = IntNest{x:13,y:14};
        self.h = IntNest{x:15,y:16};
        self.i = IntNest{x:17,y:18};
        self.j = IntNest{x:19,y:20};
    }
}