struct BigMix {
    u8: Int as uint8 = 0;
    si16: Int as int16;
    flag: Bool = false;
    s: String;
    addr: Address;
    optionalNumber: Int?;
    optionalFlag: Bool?;
    optionalString: String?; 
}

const ZERO_ADDR: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");

contract BigMixTest {
    data: BigMix = BigMix{
        si16: -1000,
        s: "hello",
        addr: ZERO_ADDR,
        optionalNumber: null,
        optionalFlag: null,
        optionalString: null
    };
}