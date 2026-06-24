struct MiddleOpt {
    a: Int;
    mid: InnerOpt?;
}

struct InnerOpt {
    foo: Int?;
}

contract MiddleHasOpt {
    storage: MiddleOpt;

    init() {
        self.storage = MiddleOpt{
            a: 1,
            mid: null
        };
    }
}