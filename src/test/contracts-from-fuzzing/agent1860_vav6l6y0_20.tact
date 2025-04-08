struct SerialOpts {
    u: Int as uint32;
    s: Int as int64;
    opt1: Int?;
    opt2: Bool?;
}

contract MixSerialization {
    data: SerialOpts = SerialOpts{
        u: 100, s: -64, opt1: null, opt2: null
    };
}