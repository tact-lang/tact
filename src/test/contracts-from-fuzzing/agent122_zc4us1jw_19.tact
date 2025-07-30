struct InnerDeep {
    value: Int?;
}

struct MiddleDeep {
    inner: InnerDeep?;
}

struct OuterDeep {
    middle: MiddleDeep?;
    flag: Bool;
}

contract OptionalNesting {
    data: OuterDeep;

    init() {
        self.data = OuterDeep{
            middle: null,
            flag: false
        };
    }
}