struct MixSer {
    a: Int as uint8;
    b: Int? as int32;
    c: Bool;
    d: Int?;
}

contract ContractMix {
    field: MixSer;

    init() {
        self.field = MixSer{
            a: 123,
            b: null,
            c: false,
            d: 456
        };
    }
}