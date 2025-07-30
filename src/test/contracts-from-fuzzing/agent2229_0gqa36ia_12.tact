struct OpStruct {
    x: Int?;
    y: Bool?;
}

contract OptStructWithDefaults {
    s: OpStruct = OpStruct { x: null, y: null };
    init() {
        self.s = OpStruct {
            x: 77,
            y: null
        };
    }
}
