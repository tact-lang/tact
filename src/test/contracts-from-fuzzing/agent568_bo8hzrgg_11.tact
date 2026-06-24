struct InnerOpt {
    field1: Int?;
    field2: Int;
}

struct OuterOpt {
    innerOpt: InnerOpt?;
    value: Int;
}

contract MultiOptContract {
    storage: OuterOpt;

    init() {
        self.storage = OuterOpt{
            innerOpt: InnerOpt{ field1: null, field2: 0 },
            value: 1
        };
    }
}