struct Ints {
    x: Int as int64;
    y: Int as uint8;
    z: Int as int257;
}

contract SerzTest {
    nums: Ints;
    init() {
        self.nums = Ints{
            x: 123,
            y: 255,
            z: -456
        };
    }
}