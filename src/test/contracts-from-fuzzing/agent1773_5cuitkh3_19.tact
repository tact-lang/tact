struct OptInner {
    x: Int?;
}

struct OuterWithOpt {
    y: OptInner?;
}

contract OptionalInOptional {
    val: OuterWithOpt;

    init() {
        self.val = OuterWithOpt{ y: null };
    }
}