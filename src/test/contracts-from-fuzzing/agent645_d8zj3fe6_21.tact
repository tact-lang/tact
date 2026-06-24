struct Inner {
    a: Int;
    b: String;
}

contract ArrayLike {
    f0: Inner;
    f1: Inner;
    f2: Inner;

    init() {
        self.f0 = Inner{a:1,b:"one"};
        self.f1 = Inner{a:2,b:"two"};
        self.f2 = Inner{a:3,b:"three"};
    }
}
