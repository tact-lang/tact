struct SerializeTest {
    a: Int as int32;
    b: Int as uint32;
    c: Int as int64;
    d: Int as uint64;
    e: Int as int128;
    f: Int as uint128;
}

contract Test18 {
    data: SerializeTest;
    init() {
        self.data = SerializeTest{
            a:1, b:2, c:3, d:4, e:5, f:6
        };
    }
}
