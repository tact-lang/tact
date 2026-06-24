struct DeepTwo {
    a: DeepOne;
}

struct DeepOne {
    b: PrimitiveStruct;
}

struct PrimitiveStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract DeepTwoLevels {
    f: DeepTwo;

    init() {
        self.f = DeepTwo{
            a: DeepOne{
                b: PrimitiveStruct{
                    x: 7,
                    y: true,
                    z: "deep",
                },
            },
        };
    }
}