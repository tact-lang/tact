struct OptionalString {
    s: String?;
}

struct DoubleWrap {
    inner: OptionalString?;
}

contract TestContract {
    field: DoubleWrap;

    init() {
        self.field = DoubleWrap{
            inner: null,
        };
    }
}