struct IntBoolStrOptional {
    i: Int;
    b: Bool;
    s: String?;
}

contract ComboTypes {
    field: IntBoolStrOptional;
    init() {
        self.field = IntBoolStrOptional{
            i: 123,
            b: false,
            s: null
        };
    }
}