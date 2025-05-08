struct SerializeTest {
    small: Int as uint4;
    tiny: Int as uint1;
    signedTiny: Int as int3;
    normal: Int;
}

contract Test {
    s: SerializeTest;
    init() {
        self.s = SerializeTest{
            small: 5,
            tiny: 1,
            signedTiny: -1,
            normal: 123,
        };
    }
}
