struct OptionalStruct {
    inner: Inner?;
}

struct Inner {
    a: Int;
    b: Int;
}

contract OptStructFieldTest {
    val: OptionalStruct;
    init() {
        self.val = OptionalStruct{
            inner: null
        };
    }
}