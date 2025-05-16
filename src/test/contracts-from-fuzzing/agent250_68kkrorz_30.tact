struct Inner {
    a: Int;
    b: Bool;
}

contract MultiStructVars {
    f1: Inner;
    f2: Inner;

    init() {
        self.f1 = Inner{a:1,b:true};
        self.f2 = Inner{a:2,b:false};
    }
}