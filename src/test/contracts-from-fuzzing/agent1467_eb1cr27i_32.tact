struct NestedOptPrimitives {
    ni: Int?;
    nb: Bool?;
    ns: String?;
}

struct DeepOptWrap {
    inner: NestedOptPrimitives;
}

contract InnerOpts {
    data: DeepOptWrap;
    init() {
        self.data = DeepOptWrap{
            inner: NestedOptPrimitives{
                ni: null,
                nb: null,
                ns: null
            }
        };
    }
}