struct OptionalNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    val: Int;
}

contract TestContract {
    opt: OptionalNested;

    init() {
        self.opt = OptionalNested{
            inner: null
        };
    }
}