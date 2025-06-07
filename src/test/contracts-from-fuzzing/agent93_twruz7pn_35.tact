struct InnerMixSerial {
    sInt: Int as int32;
    uInt: Int as uint16;
    bigInt: Int;
}

struct OuterMixSerial {
    child: InnerMixSerial;
    flag: Bool;
}

contract MixSerialNested {
    data: OuterMixSerial;

    init() {
        self.data = OuterMixSerial{
            child: InnerMixSerial{
                sInt: -1000,
                uInt: 65000,
                bigInt: 123456789012345,
            },
            flag: false,
        };
    }
}