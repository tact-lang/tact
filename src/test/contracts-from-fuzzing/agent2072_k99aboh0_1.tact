struct BasicStruct { field1: Int; field2: Bool; field3: String; }

contract StorageTest {
    data: BasicStruct;

    init() {
        self.data = BasicStruct{ field1: 5, field2: true, field3: "abc" };
    }
}