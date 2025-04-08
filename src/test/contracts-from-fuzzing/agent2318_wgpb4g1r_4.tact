struct InnerMost {
    x: Int;
    y: Bool;
}

struct MiddleOpt {
    data: InnerMost?;
}

struct OuterOpt {
    wrapper: MiddleOpt?;
}

contract TestContract {
    val: OuterOpt = OuterOpt{ wrapper: null };

    init() {
        self.val = OuterOpt{
            wrapper: MiddleOpt{
                data: InnerMost{ x: 42, y: true }
            }
        };
    }
}
