struct OptionalInner {
    flag: Bool?;
}

struct OptionalOuter {
    inner: OptionalInner?;
}

contract TestContract {
    opt: OptionalOuter;

    init() {
        self.opt = OptionalOuter{
            inner: OptionalInner{
                flag: true
            }
        };
    }
}
