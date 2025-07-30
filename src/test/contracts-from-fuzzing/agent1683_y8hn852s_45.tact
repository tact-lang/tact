struct InnerMost {
    x: Int = 5;
    y: Bool = false;
}

struct MiddleOpt {
    m: InnerMost? = null;
}

struct OuterOpt {
    outer: MiddleOpt? = null;
}

contract DeepOptDefaults {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{};
    }

    receive() {
        self.val = OuterOpt{ outer: MiddleOpt{ m: InnerMost{ x:42, y:true } } };
    }
}