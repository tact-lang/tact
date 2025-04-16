struct OptionalNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    val: Int;
}

contract TestContract {
    d: OptionalNested;

    init() {
        self.d = OptionalNested{
            inner: null
        };
    }
}