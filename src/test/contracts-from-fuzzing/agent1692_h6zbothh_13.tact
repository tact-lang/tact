struct InnerNested {
    x: Int;
    y: Bool?;
    z: String;
}

struct MidNested {
    alpha: InnerNested?;
    beta: String;
    gamma: Bool;
}

struct LargeComplex {
    field1: Int;
    field2: String;
    field3: Bool?;
    field4: Int?;
    field5: MidNested;
    field6: MidNested?;
    field7: InnerNested;
    field8: InnerNested?;
    field9: Bool;
    field10: String?;
}

contract LargeComplexStorage {
    data: LargeComplex;

    init() {
        self.data = LargeComplex{
            field1: 1,
            field2: "text",
            field3: null,
            field4: null,
            field5: MidNested{
                alpha: null,
                beta: "beta",
                gamma: true
            },
            field6: null,
            field7: InnerNested{
                x: 7,
                y: null,
                z: "zval"
            },
            field8: null,
            field9: false,
            field10: null
        };
    }
}