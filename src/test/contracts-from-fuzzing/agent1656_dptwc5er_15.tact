struct OptionalOuter {
    inner: InnerStruct?;
}

struct InnerStruct {
    id: Int;
    flag: Bool?;
}

contract OptionalOuterTest {
    data: OptionalOuter;

    init() {
        self.data = OptionalOuter{
            inner: null
        };
    }
}
