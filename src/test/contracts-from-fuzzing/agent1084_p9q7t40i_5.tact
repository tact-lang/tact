struct OptionalNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int = 100;
}

contract TestContract {
    n: OptionalNested = OptionalNested{};
    init() {}
    receive() {}
}