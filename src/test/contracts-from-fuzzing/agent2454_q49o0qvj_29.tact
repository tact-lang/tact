struct OptStruct {
    inner: Inner?;
}

struct Inner {
    x: Int;
}

contract OptStructTest {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            inner: null
        };
    }
}