struct InnerOpt {
    innerField: Int?;
}

struct OuterOpt {
    optInner: InnerOpt?;
    anotherOpt: Int?;
}

contract OptionalStructs {
    store: OuterOpt;

    init() {
        self.store = OuterOpt{
            optInner: null,
            anotherOpt: null
        };
    }

    receive() {
        self.store = OuterOpt{
            optInner: InnerOpt{innerField: 42},
            anotherOpt: 255
        };
    }
}