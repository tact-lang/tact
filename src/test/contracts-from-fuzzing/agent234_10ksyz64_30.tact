struct SerialOverrides {
    x: Int as int8;
    y: Int as uint128;
    z: Int;
}

contract SerialOverrideTest {
    s: SerialOverrides;

    init() {
        self.s = SerialOverrides{
            x: -5,
            y: 1000000,
            z: 42
        };
    }
}