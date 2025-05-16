struct EmptyStr {
    s: String;
    p: Int;
}

struct OptionalStruct {
    inner: EmptyStr?;
    otherField: Bool;
}

contract NestedOptionalStruct {
    d: OptionalStruct;

    init() {
        self.d = OptionalStruct{
            inner: null,
            otherField: true
        };
    }
}