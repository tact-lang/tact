struct NestedWeirdSerializations {
    s: Int as int4;
    t: Int as uint9;
    u: Int as int12;
    v: Int as uint17;
}

contract NestedWeirdSerialTest {
    weird: NestedWeirdSerializations;

    init() {
        self.weird = NestedWeirdSerializations{
            s: -3,
            t: 511,
            u: 2047,
            v: 131071
        };
    }
}