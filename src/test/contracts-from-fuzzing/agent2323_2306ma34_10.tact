struct OptionalStruct {
    inner: Inner?;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract OptionalStructTest {
    optStruct: OptionalStruct;

    init() {
        self.optStruct = OptionalStruct{
            inner: null
        };
    }
}