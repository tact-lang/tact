// Struct with mixed optional and default, nested in another optional
struct InnerMost {
    value: Int?;
    flag: Bool = false;
}

struct OuterWrap {
    wrap: InnerMost?;
    count: Int;
}

contract TestContract {
    top: OuterWrap;
    init() {
        self.top = OuterWrap{
            wrap: InnerMost {
                value: null,
                flag: true
            },
            count: 100
        };
    }
}