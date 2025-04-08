struct RangeSerialization {
    x: Int as int8;
    y: Int as uint8;
    z: Int as uint1;
}

contract TestContract {
    s: RangeSerialization;

    init() {
        self.s = RangeSerialization{
            x: -10,
            y: 200,
            z: 1
        };
    }
}