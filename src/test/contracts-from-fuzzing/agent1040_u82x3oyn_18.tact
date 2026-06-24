struct OuterWrapper {
    optStruct: InnerStruct?;
}

struct InnerStruct {
    a: Int;
}

contract StructOrderTest {
    data: OuterWrapper;

    init() {
        self.data = OuterWrapper{
            optStruct: InnerStruct{ a: 123 },
        };
    }
}