struct OptionalContainer {
    x: Int?;
    y: Bool?;
}

struct OuterOptWrap {
    inner: OptionalContainer;
    s: String?;
}

contract OptionalFunnel {
    store: OuterOptWrap;
    init() {
        self.store = OuterOptWrap{
            inner: OptionalContainer{
                x: null,
                y: true
            },
            s: null
        };
    }
}