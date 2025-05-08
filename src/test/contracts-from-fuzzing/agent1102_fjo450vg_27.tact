// optional contract storage of nested struct with optional
struct InnerOpt {
    flag: Bool?;
}

struct OuterWrap {
    inner: InnerOpt?;
}

contract OptInnerStructStore {
    data: OuterWrap?;

    init() {
        self.data = OuterWrap{
            inner: InnerOpt{ flag: null }
        };
    }
}
