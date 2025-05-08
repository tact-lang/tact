struct NestedEmptyText {
    inner: InnerOpt;
}

struct InnerOpt {
    text: String?;
    number: Int;
}

contract StructWithOptionalNullString {
    data: NestedEmptyText;

    init() {
        self.data = NestedEmptyText{
            inner: InnerOpt{
                text: null,
                number: 1000,
            },
        };
    }
}