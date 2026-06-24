struct Inner {
    a: Int;
    b: Bool;
}

contract DefaultsMissing {
    inr: Inner;  // no default

    init() {
        self.inr = Inner{a:5,b:true};
    }
}