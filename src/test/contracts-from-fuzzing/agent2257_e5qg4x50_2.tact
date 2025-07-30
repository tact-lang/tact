struct NestedStruct {
    field1: Int;
    field2: Bool?;
    field3: String;
    field4: Address?;
    field5: Cell;
    field6: Slice?;
}

struct OuterStruct {
    nested: NestedStruct;
    extra: Bool;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: NestedStruct{
                field1: 1,
                field2: null,
                field3: "abc",
                field4: null,
                field5: emptyCell(),
                field6: null,
            },
            extra: true,
        };
    }
}