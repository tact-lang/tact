struct NestedFields {
    ia: Int as int8;
    ua: Int as uint8;
    ib: Int as int16;
    ub: Int as uint16;
    ic: Int as int32;
    uc: Int as uint32;
    s: String;
    opti: Int?;
    optb: Bool?;
}

contract SerializedNested {
    payload: NestedFields;

    init() {
        self.payload = NestedFields{
            ia: -128,
            ua: 255,
            ib: -32768,
            ub: 65535,
            ic: -2147483648,
            uc: 4294967295,
            s: "abc",
            opti: null,
            optb: true,
        };
    }
}
