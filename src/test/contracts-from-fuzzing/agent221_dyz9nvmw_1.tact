struct DeepNested {
    a: Int;
    b: Int?;
    c: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Int?;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            a: 1,
            b: null,
            c: InnerStruct{
                x: 10,
                y: null,
            }
        };
    }
}
