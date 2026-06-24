struct PackedStruct {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    num1: Int as uint8;
    num2: Int as uint8;
}

contract PackedFields {
    packed: PackedStruct;

    init() {
        self.packed = PackedStruct{
            b1: true,
            b2: false,
            b3: true,
            num1: 255,
            num2: 128,
        };
    }
}
