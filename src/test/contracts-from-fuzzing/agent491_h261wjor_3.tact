struct OptionalStructInner {
    value: Int?;
    name: String?;
}

struct OptionalStructOuter {
    inner: OptionalStructInner?;
}

contract OptionalsDeep {
    opt: OptionalStructOuter;
    init() {
        self.opt = OptionalStructOuter{
            inner: OptionalStructInner{
                value: null,
                name: null,
            }
        };
    }
}