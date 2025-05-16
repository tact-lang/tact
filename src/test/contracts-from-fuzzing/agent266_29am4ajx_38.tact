struct MixSerializeOpt {
    a: Int as uint4;
    b: Int?;
    c: Int as uint8;
    d: Bool?;
}

contract MixSerOptContract {
    data: MixSerializeOpt;

    init() {
        self.data = MixSerializeOpt{
            a: 5,
            b: null,
            c: 128,
            d: true
        };
    }
}