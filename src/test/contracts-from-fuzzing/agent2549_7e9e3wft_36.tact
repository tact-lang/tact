struct WeirdSerialize {
    i1: Int as uint8;
    i2: Int as int64;
    i3: Int as uint4;
}

contract SerialTest {
    f: WeirdSerialize;

    init() {
        self.f = WeirdSerialize{
            i1: 255,
            i2: -123456,
            i3: 12
        };
    }
}