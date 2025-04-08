struct DeepNested {
    a: Int;
    bOpt: Bool?;
    inner: InnerStruct;
}

struct InnerStruct {
    x: String;
    y: Int?;
}

contract TestContract {
    field: DeepNested;

    init() {
        self.field = DeepNested{
            a: 5,
            bOpt: false,
            inner: InnerStruct{
                x: "hello",
                y: null,
            },
        };
    }

    receive() {
        let z = self.field.inner.x;
    }
}