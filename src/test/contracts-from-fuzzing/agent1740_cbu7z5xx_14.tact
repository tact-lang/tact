struct SInner {
    x: Int;
}

contract ArrayLike {
    s1: SInner;
    s2: SInner;
    s3: SInner;

    init() {
        self.s1 = SInner { x: 1 };
        self.s2 = SInner { x: 2 };
        self.s3 = SInner { x: 3 };
    }
}