struct FullMix {
    i: Int;
    s: String;
    b: Bool;
    addr: Address;
    optI: Int?;
    optS: String?;
    i8: Int as int8;
    u8: Int as uint8;
}

contract LargeStructState {
    content: FullMix = FullMix{
        i: 7,
        s: "test",
        b: true,
        addr: address("0:0000000000000000000000000000000000000000000000000000000000000000"),
        optI: null,
        optS: "str",
        i8: -5,
        u8: 250
    };
}