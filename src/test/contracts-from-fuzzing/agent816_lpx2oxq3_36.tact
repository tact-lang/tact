struct StructWithBooleans {
    x: Bool;
    y: Bool?;
}

contract StructWithBoolField {
    s: StructWithBooleans;

    init() {
        self.s = StructWithBooleans{
            x: true,
            y: null,
        };
    }
}
