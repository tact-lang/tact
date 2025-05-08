struct OptionalNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    val: Int;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            inner: null
        };
    }
}