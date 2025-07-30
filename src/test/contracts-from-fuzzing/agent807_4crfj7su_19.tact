// contract with nested struct having nested optional of struct
struct InnerMost {
    val: Int;
}

struct InnerWrap {
    inner: InnerMost?;
}

struct OuterWrap {
    wrap: InnerWrap;
}

contract OptionalWrapped {
    data: OuterWrap;
    init() {
        self.data = OuterWrap{
            wrap: InnerWrap{ inner: null }
        };
    }
}