struct InnerStruct {
    field1: Int;
    field2: Bool;
}

struct OuterStruct {
    optInner: InnerStruct?;
}

contract OptStructFieldTest {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{ optInner: null };
    }
}