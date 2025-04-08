struct InnerMost {
    name: String;
}

struct MiddleOne {
    detail: InnerMost;
    amount: Int?;
}

struct OuterMost {
    middle: MiddleOne?;
    token: String?;
    flag: Bool;
}

contract OptionalOuter {
    storage: OuterMost;

    init() {
        self.storage = OuterMost{
            middle: null,
            token: null,
            flag: true,
        };
    }
}
