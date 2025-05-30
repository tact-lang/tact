struct SInner {
    a: Int;
    b: Bool;
}

contract SeqNested {
    s1: SInner;
    s2: SInner;
    s3: SInner;

    init() {
        self.s1 = SInner{a:1, b:true};
        self.s2 = SInner{a:2, b:false};
        self.s3 = SInner{a:3, b:true};
    }
}
