struct InnerInner {
    x: Int;
    y: Bool;
}

struct Inner {
    sub: InnerInner;
    a: Int?;
}

contract PartialInit {
    field: Inner;

    init() {
        self.field = Inner{ sub: InnerInner{x:5,y:true}, a: null };
    }
}
