struct InnerInner {
    z: String;
}

struct Inner {
    y: Bool;
    sub: InnerInner;
}

contract DeepThreeLevels {
    val: Inner;

    init() {
        self.val = Inner{ y:true, sub:InnerInner{z:"str"} };
    }
}