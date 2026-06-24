struct WithOptionalStruct {
    field1: Int;
    field2: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract OptStructTest {
    s: WithOptionalStruct;

    init() {
        self.s = WithOptionalStruct{
            field1: 10,
            field2: InnerStruct{ a: 1, b: false }
        };
    }
}