struct InnerStruct {
    foo: Int;
}

struct OuterStruct {
    inner: InnerStruct;
}

contract DefaultInitTest {
    state: OuterStruct;

    init() {
        self.state = OuterStruct{
            inner: InnerStruct{
                foo: 999
            }
        };
    }
}