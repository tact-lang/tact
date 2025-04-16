struct NestedOptionalStruct {
    s1: OptionalInner?;
    s2: OptionalInner?;
}

struct OptionalInner {
    v: Int;
}

contract NestedOptionalStructTest {
    data: NestedOptionalStruct;
    init() {
        self.data = NestedOptionalStruct{};
    }
}