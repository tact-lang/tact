struct OptNestedDeeper {
    s: String?;
}

struct OptNested {
    inner: OptNestedDeeper?;
}

contract OptionalStructs {
    field: OptNested;

    init() {
        self.field = OptNested{
            inner: null
        };
    }
}