struct SerialBool {
    a: Bool;
    b: Bool;
    c: Bool?;
}

contract BoolSerialize {
    bval: SerialBool;

    init() {
        self.bval = SerialBool{
            a: true,
            b: false,
            c: null
        };
    }
}