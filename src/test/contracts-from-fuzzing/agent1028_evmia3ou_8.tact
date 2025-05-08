struct DiverseInts {
    iBig: Int as int257;
    iNegSmall: Int as int4;
    iPosSmall: Int as uint3;
    iMedium: Int as int128;
    iPosLarge: Int as uint200;
    normal: Int;
}

contract DiverseSerializationTest {
    nums: DiverseInts;

    init() {
        self.nums = DiverseInts{
            iBig: 123456789,
            iNegSmall: -7,
            iPosSmall: 5,
            iMedium: -50000,
            iPosLarge: 12345678901234567890,
            normal: 42,
        };
    }
}
