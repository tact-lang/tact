struct DeepNested {
    a: Int;
    b: OptionalStruct; 
}

struct OptionalStruct {
    x: Int?;
    y: InnerOptionalStruct?;
}

struct InnerOptionalStruct {
    p: Int?;
    q: Int;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            a: 1,
            b: OptionalStruct{
                x: null,
                y: InnerOptionalStruct{
                    p: null,
                    q: 42,
                },
            },
        };
    }
}