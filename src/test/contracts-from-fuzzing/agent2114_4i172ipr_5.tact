struct S {
    x: Int;
    y: Bool;
}

contract ArrayLike {
    v0: S;
    v1: S;
    v2: S;
    v3: S;
    v4: S;
    init() {
        self.v0 = S{x:0,y:true};
        self.v1 = S{x:1,y:false};
        self.v2 = S{x:2,y:true};
        self.v3 = S{x:3,y:false};
        self.v4 = S{x:4,y:true};
    }
}
