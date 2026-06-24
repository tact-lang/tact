struct NestedStruct {
    x: Int;
    y: Bool;
    z: String?;
    deep: InnerStruct?;
}

struct InnerStruct {
    a: Int as uint32;
    b: Bool?;
    c: String;
}

contract StructInStorage {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            x: 1,
            y: true,
            z: null,
            deep: null,
        };
    }
}