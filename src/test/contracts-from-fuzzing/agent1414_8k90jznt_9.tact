struct SerOpt {
    a: Int as uint8;
    b: Int?;
    c: Int as int32;
    d: Int? as uint16;
}

contract StructSerOptTest {
    s: SerOpt;

    init() {
        self.s = SerOpt {
            a: 200,
            b: null,
            c: -100000,
            d: null
        };
    }
}