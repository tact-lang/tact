struct OptionBool2 {
    a: Bool?;
    b: Bool?;
    c: Bool?;
}

contract PackedNulls {
    x: OptionBool2;

    init() {
        self.x = OptionBool2{
            a: null,
            b: null,
            c: null,
        };
    }
}