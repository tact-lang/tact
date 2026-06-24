struct OptionalNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{
            inner: null,
        };
    }
}