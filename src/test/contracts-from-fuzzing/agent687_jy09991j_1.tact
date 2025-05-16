struct InnerStruct { a: Int; b: Bool; }

struct OuterStruct { x: Int; y: InnerStruct; }

contract StorageTest {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            x: 10,
            y: InnerStruct{ a: 1, b: true }
        };
    }
}