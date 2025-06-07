struct OptionalNestedInner {
    a: Int?;
    b: Bool?;
}

struct OptionalWrap {
    data: OptionalNestedInner?;
}

contract OptNestWrap {
    mydata: OptionalWrap;

    init() {
        self.mydata = OptionalWrap{
            data: null
        };
    }
}
