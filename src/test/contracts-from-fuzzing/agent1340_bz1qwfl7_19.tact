struct WithSerialization {
    tiny: Int as uint4;
    mid: Int as int32;
    big: Int as uint128;
    normal: Int;
}

contract SerializeCombos {
    data: WithSerialization;

    init() {
        self.data = WithSerialization{
            tiny: 7,
            mid: -1000,
            big: 123456789,
            normal: 987654321,
        };
    }
}