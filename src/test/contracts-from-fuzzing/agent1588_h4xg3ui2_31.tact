struct Ascribe {
    x: Int as int64;
    y: Int as uint32;
    z: Int;
}

contract AscribeTest {
    v: Ascribe;
    init() {
        self.v = Ascribe {
            x: 123456789,
            y: 4294967295,
            z: 100,
        };
    }
}