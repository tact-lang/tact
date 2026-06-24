struct NestedPoint {
    x: Int as int64;
    y: Int as int64;
}

struct BigStruct {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Cell;
    field5: Address;
    nested: NestedPoint;
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalNested: NestedPoint?;
}

contract ComplexStorage {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            field1: 1,
            field2: true,
            field3: "Test",
            field4: emptyCell(),
            field5: myAddress(),
            nested: NestedPoint{ x: 10, y: 20 },
            optionalInt: null,
            optionalBool: null,
            optionalNested: null,
        };
    }
}