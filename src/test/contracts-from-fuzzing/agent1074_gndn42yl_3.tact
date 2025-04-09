struct OptionalNested {
    sub: OptionalInner?;
}

struct OptionalInner {
    value: Int?;
}

contract TestContract {
    optNest: OptionalNested;

    init() {
        self.optNest = OptionalNested{
            sub: OptionalInner{
                value: null
            }
        };
    }
}
