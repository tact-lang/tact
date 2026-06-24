struct S {
    x: Int;
    y: Int;
    z: Int;
}

contract MultiS {
    a: S;
    b: S;
    c: S;
    d: S;

    init() {
        self.a = S{x:1,y:2,z:3};
        self.b = S{x:4,y:5,z:6};
        self.c = S{x:7,y:8,z:9};
        self.d = S{x:10,y:11,z:12};
    }
}