struct S {
    x: Int;
    y: Bool;
}

contract ArrayLike {
    s0: S; s1: S; s2: S; s3: S; s4: S;
    init() {
        self.s0 = S{ x:0, y:true };
        self.s1 = S{ x:1, y:false };
        self.s2 = S{ x:2, y:true };
        self.s3 = S{ x:3, y:false };
        self.s4 = S{ x:4, y:true };
    }
}