struct NestedStruct {
    x: Int;
    y: Bool;
    s: InnerStruct;
}

struct InnerStruct {
    z: Int;
    flag: Bool;
}

contract NestedStructFields {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            x: 42,
            y: true,
            s: InnerStruct{
                z: 7,
                flag: false,
            },
        };
    }
}