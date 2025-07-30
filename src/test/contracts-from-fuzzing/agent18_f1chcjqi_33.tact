struct SerializeOpts {
    x: Int as uint32;
    y: Int as int64;
    z: Int as uint8;
}

contract SerializeOptsTest {
    data: SerializeOpts;
    init() {
        self.data = SerializeOpts{ x:1, y:2, z:3 };
    }
}