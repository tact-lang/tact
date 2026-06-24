struct SerializationLimits {
    a: Int as uint4;
    b: Int as int4;
    c: Int as uint1;
    d: Int as int1;
}

contract TestContract {
    smalls: SerializationLimits;

    init() {
        self.smalls = SerializationLimits{
            a: 8,
            b: -8,
            c: 1,
            d: -1,
        };
    }
}