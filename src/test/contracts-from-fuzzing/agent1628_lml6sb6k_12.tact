struct MixNested {
    a: Int;
    b: Bool;
    c: String;
    nested: NestedStruct;
}

struct NestedStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract ContractMixNested {
    data: MixNested;

    init() {
        self.data = MixNested{
            a: 1,
            b: true,
            c: "hello",
            nested: NestedStruct{
                x: 2,
                y: false,
                z: "world"
            }
        };
    }
}