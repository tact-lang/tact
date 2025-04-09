struct OptionalNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    val: Int;
    flag: Bool;
}

contract TestContract {
    n: OptionalNested;

    init() {
        self.n = OptionalNested{
            inner: null,
        };
    }
}
