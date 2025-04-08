struct SerializeMix {
    is_true: Bool;
    n: Int as uint8;
    big_n: Int as int64;
    txt: String;
    opt_i: Int? as uint16;
}

contract SerializeMixTest {
    field: SerializeMix;

    init() {
        self.field = SerializeMix{
            is_true: false,
            n: 5,
            big_n: 1234567890,
            txt: "tact",
            opt_i: null
        };
    }
}