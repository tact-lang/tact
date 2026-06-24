struct OptionalInner {
    inner: String?;
}

contract NestedOptionField {
    field: OptionalInner;

    init() {
        self.field = OptionalInner{
            inner: "string"
        };
    }
}