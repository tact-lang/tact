struct NestedOpt {
    x: Int?;
    y: Bool?;
}

struct DoubleOptWrap {
    inner: NestedOpt?;
}

contract DoubleOptionalFieldStorage {
    val: DoubleOptWrap;

    init() {
        self.val = DoubleOptWrap{
            inner: NestedOpt{
                x: null,
                y: true,
            },
        };
    }
}
