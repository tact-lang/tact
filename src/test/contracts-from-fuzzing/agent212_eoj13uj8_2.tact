struct DeepNested {
    x: Int;
    y: Bool?;
    z: InnerStruct;
}

struct InnerStruct {
    s: String;
    b: Bool = false;
}

contract TestContract {
    data: DeepNested = DeepNested{
        x: 1,
        y: null,
        z: InnerStruct{
            s: "abc",
            b: true,
        },
    };
    
    init() {}
}