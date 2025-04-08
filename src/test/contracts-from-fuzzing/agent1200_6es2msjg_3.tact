struct NestedStruct {
    a: Int;
    b: Bool;
    c: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract DeepStructStorage {
    data: NestedStruct;
    init() {
        self.data = NestedStruct{
            a: 5,
            b: false,
            c: InnerStruct{
                x: 1,
                y: true,
                z: "xyz",
            }
        };
    }
}