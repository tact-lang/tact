struct StringAndBool {
    s: String;
    b: Bool;
}

struct OptionalOuter {
    v: Int?;
    inner: StringAndBool?;
}

contract NestedOptionalFields {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter{
            v: null,
            inner: StringAndBool{s:"ok",b:true}
        };
    }
}