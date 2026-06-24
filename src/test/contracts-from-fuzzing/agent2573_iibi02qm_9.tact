struct SerOpt {
    a: Int? as int8;
    b: Int? as uint8;
    c: Int? as int32;
    d: Int? as uint32;
    e: Int? as int256;
    f: Int? as uint256;
    s: String?;
    flag: Bool?;
}

contract OptSerStruct {
    field: SerOpt;

    init() {
        self.field = SerOpt{
            a: null,
            b: 5,
            c: -500,
            d: 500,
            e: null,
            f: 123456789,
            s: null,
            flag: true,
        };
    }
}