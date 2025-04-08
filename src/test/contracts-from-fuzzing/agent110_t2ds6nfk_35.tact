struct Inner {
    a: Int?;
    b: Bool;
}

contract UsePartial {
    f: Inner;
    init() {
        self.f = Inner{b:true};
    }
}