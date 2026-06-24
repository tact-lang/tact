struct IntStruct { x: Int }

struct OptionalStruct {
    inner: IntStruct?;
}

contract OptionalStructFieldTest {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            inner: null
        };
    }
}
