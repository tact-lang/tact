struct MultiTypes {
    u8: Int as uint8;
    i16: Int as int16;
    b: Bool;
    s: String;
}

contract SerializeVariants {
    data: MultiTypes;

    init() {
        self.data = MultiTypes{ u8: 5, i16: -1000, b: true, s: "hi" };
    }
}
