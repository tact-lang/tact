struct Wr {
    val: Int;
}

contract ArrayLike {
    a: Wr;
    b: Wr;
    c: Wr;
    d: Wr;

    init() {
        self.a=Wr{val:1};
        self.b=Wr{val:2};
        self.c=Wr{val:3};
        self.d=Wr{val:4};
    }
}