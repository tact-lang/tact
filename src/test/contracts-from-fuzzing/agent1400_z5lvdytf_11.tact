struct SerializeTest {
    x: Int as uint8;
    y: Int as int16;
    z: Int as uint32;
}

contract SerializedVars {
    data: SerializeTest;

    init() {
        self.data = SerializeTest{
            x: 255,
            y: -32768,
            z: 4294967295
        };
    }
}
