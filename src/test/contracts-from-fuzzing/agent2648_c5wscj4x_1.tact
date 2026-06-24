struct NestedStruct {
    a: Int;
    b: Int?;
}

struct OuterStruct {
    nsField: NestedStruct;
    intField: Int;
    optionalStruct: NestedStruct?;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nsField: NestedStruct{ a: 1, b: null },
            intField: 2,
            optionalStruct: null
        };
    }
}