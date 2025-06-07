struct DeepNested { inner: InnerStruct; }

struct InnerStruct { x: Int; y: Bool; }

contract DeepStorage {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{ inner: InnerStruct{ x: 10, y: false } };
    }
}