struct DeepStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Int?;
    z: NestedStruct;
}

struct NestedStruct {
    a: Bool;
    b: String;
    c: Bool?;
}

contract DeepStorageTest {
    item: DeepStruct;

    init() {
        self.item = DeepStruct{
            inner: InnerStruct{
                x: 5,
                y: null,
                z: NestedStruct{
                    a: false,
                    b: "hello",
                    c: true,
                }
            }
        };
    }
}