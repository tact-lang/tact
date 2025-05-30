struct OptWrap {
    val: Int?;
    nested: NestedOpt?;
}

struct NestedOpt {
    deeper: Int?;
}

contract OptionalContract {
    data: OptWrap;

    init() {
        self.data = OptWrap{
            val: null,
            nested: null,
        };
    }
}
