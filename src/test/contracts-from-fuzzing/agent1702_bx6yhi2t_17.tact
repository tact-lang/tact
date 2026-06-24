struct S {
    x: Int;
    y: Bool;
}

contract ArrayLikeWide {
    s1: S;
    s2: S;
    s3: S;

    init() {
        self.s1 = S{x:1,y:true};
        self.s2 = S{x:2,y:false};
        self.s3 = S{x:3,y:true};
    }
}
