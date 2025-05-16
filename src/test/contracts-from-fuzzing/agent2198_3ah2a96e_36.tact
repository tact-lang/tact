struct Inner {
    a: Int;
    b: Bool;
}

contract WithArrayOfInner {
    i0: Inner;
    i1: Inner;
    i2: Inner;
    i3: Inner;

    init() {
        self.i0 = Inner{a:0,b:true};
        self.i1 = Inner{a:1,b:false};
        self.i2 = Inner{a:2,b:true};
        self.i3 = Inner{a:3,b:false};
    }
}