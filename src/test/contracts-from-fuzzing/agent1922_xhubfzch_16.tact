struct OverflowStruct {
    s1: Int as uint8;
    s2: Int as uint8;
}

contract OverflowTest {
    data: OverflowStruct;

    init() {
        self.data = OverflowStruct{
            s1: 256, // outside uint8
            s2: 0
        };
    }
}