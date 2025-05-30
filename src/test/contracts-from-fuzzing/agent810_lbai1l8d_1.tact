struct DeepNested {
    x: Int;
    y: Int?;
}

struct MidNested {
    a: DeepNested;
    b: DeepNested?;
}

struct OuterStruct {
    m: MidNested;
    n: MidNested?;
}

contract DeepContract {
    data: OuterStruct;
    init() {
        self.data = OuterStruct{
            m: MidNested{
                a: DeepNested{ x: 1, y: null },
                b: null,
            },
            n: null,
        };
    }
}
