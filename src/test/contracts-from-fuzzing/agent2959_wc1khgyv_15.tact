struct DeepOpt {
    a: Int?;
    b: Bool?;
}

struct MedOpt {
    x: DeepOpt?;
    y: Int;
}

contract StructWithOptionalNestedStruct {
    val: MedOpt;

    init() {
        self.val = MedOpt{
            x: null,
            y: 99
        };
    }
}