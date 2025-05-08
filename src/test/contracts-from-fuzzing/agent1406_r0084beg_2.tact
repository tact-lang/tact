struct DeepNested {
    a: Bool;
    b: String;
    c: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: String;
    z: Bool?;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            a: true,
            b: "hello",
            c: InnerStruct{
                x: 42,
                y: "world",
                z: null,
            },
        };
    }
}
