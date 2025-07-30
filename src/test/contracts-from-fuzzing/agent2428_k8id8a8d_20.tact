struct Inner {
    x: Int as uint32;
    y: Bool;
}

contract C {
    f: Inner;

    init() {
        self.f = Inner{ x:0, y:true };
    }
}