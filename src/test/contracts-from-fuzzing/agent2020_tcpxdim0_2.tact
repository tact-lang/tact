struct BasicStruct {
    x: Int;
    y: Int;
    z: Int;
}

struct NestedStruct {
    inner: BasicStruct;
    extra: Int;
}

contract NestedStorageTest {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            inner: BasicStruct{
                x: 10,
                y: 20,
                z: 30,
            },
            extra: 99,
        };
    }
}
