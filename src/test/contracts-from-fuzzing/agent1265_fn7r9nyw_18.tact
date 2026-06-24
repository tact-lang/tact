struct InnerOpt {
    value: Int?;
    active: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    desc: String?;
    ready: Bool;
}

contract NestedOptionals {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: null,
            desc: null,
            ready: false
        };
    }
}