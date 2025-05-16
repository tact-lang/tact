struct OptionalInner {
    a: Int?;
}

struct OptionalOuter {
    inr: OptionalInner?;
}

contract OptionalInsideOptional {
    st: OptionalOuter;
    init() {
        self.st = OptionalOuter{
            inr: OptionalInner{
                a: 1
            }
        };
    }
}