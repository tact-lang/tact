struct MultiSerialize {
    i1: Int as uint8;
    i2: Int as uint16;
    i3: Int as int32;
    i4: Int as int64;
    b: Bool;
    s: String;
}

contract MultiSerializationTest {
    m: MultiSerialize;

    init() {
        self.m = MultiSerialize{
            i1: 5,
            i2: 258,
            i3: -10000,
            i4: 5000,
            b: true,
            s: "serialize"
        };
    }

    receive(){}
}