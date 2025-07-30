struct NestedPoint {
    x: Int as int64;
    y: Int as int64;
}

struct OuterStruct {
    name: String = "Alice";
    optionalNested: NestedPoint?;
    number: Int as uint32;
}

contract StorageTest {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            number: 42,
            optionalNested: null
        };
    }
}