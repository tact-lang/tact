struct Tiny {
    x: Int;
}
contract MultiTiny {
    s1: Tiny;
    s2: Tiny;
    s3: Tiny;

    init() {
        self.s1=Tiny{x:1};
        self.s2=Tiny{x:2};
        self.s3=Tiny{x:3};
    }
}