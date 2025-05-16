struct IntBool {
    x: Int;
    y: Bool;
    ox: Int?;
    oy: Bool?;
}

contract ComboStruct {
    data: IntBool;
    init() {
        self.data = IntBool{
            x: 2,
            y: false,
            ox: null,
            oy: null
        };
    }
}