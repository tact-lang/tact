struct MiddleOpt {
    v: Int?;
}

struct OuterOpt {
    m: MiddleOpt?;
}

contract StackedOptionals {
    data: OuterOpt?;
    init() {
        self.data = null;
    }
}