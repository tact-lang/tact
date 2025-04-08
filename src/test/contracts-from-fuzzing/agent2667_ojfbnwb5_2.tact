struct NestedStruct {
    s1: InnerStruct;
    s2: InnerStruct;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract NestedFieldsTest {
    field: NestedStruct;

    init() {
        self.field = NestedStruct{
            s1: InnerStruct{a: 1, b: true},
            s2: InnerStruct{a: 2, b: false}
        };
    }

    receive() {
        self.field = NestedStruct{
            s1: InnerStruct{a: 3, b: false},
            s2: InnerStruct{a: 4, b: true}
        };
    }
}