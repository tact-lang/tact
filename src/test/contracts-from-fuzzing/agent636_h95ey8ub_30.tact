struct InnerMost {
    value: Int;
}

struct InnerOpt {
    nested: InnerMost?;
}

struct OuterOpt {
    nestedOpt: InnerOpt?;
}

contract MultiLevelOptionalNull {
    top: OuterOpt;

    init() {
        self.top = OuterOpt{
            nestedOpt: null
        };
    }
}