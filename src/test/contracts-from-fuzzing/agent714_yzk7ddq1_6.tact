struct OptionalNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    val: Int;
    flag: Bool;
}

contract OptionalStructTest {
    info: OptionalNested;

    init() {
        self.info = OptionalNested{
            inner: InnerStruct{ val: 42, flag: true }
        };
    }
}