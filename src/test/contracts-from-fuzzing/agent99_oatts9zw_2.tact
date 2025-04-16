struct NestedStruct {
    s: String;
    inner: InnerStruct;
}

struct InnerStruct {
    n: Int;
    flag: Bool;
}

contract StorageTest {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{
            s: "hello",
            inner: InnerStruct{n: 5, flag: true}
        };
    }
}