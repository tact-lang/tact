struct OptionalNested {
    inner: Inner?;
    flag: Bool;
}

struct Inner {
    data: Int;
    flag: Bool;
}

contract Test {
    field: OptionalNested;
    init() {
        self.field = OptionalNested{
            inner: null,
            flag: true
        };
    }
}