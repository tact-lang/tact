struct OutOfRangeTest {
    tiny: Int as uint2; // can only hold 0..3
}

contract TestOutOfRange {
    data: OutOfRangeTest;

    init() {
        self.data = OutOfRangeTest{
            tiny: 5
        };
    }
}