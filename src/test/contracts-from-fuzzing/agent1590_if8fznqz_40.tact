struct DeepSerializeOpt {
    a: Int? as int8;
    b: Int? as uint8;
    c: Int? as int16;
    d: Int? as uint32;
    e: Int? as uint64;
    f: Int? as int128;
    g: Int? as uint256;
}

contract SeriesOptionals {
    val: DeepSerializeOpt;

    init() {
        self.val = DeepSerializeOpt{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}