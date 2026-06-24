struct OptionalNested {
    s: String?;
    inner: InnerStruct?;
}

struct InnerStruct {
    i: Int;
    b: Bool;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            s: null,
            inner: InnerStruct{ i: 123, b: false }
        };
    }
}