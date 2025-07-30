struct PaddingTest {
    b1: Bool;
    i1: Int as int8;
    b2: Bool;
    i2: Int as int8;
    b3: Bool;
}

contract AlignStorage {
    data: PaddingTest;

    init() {
        self.data = PaddingTest{
            b1: true,
            i1: 1,
            b2: false,
            i2: -1,
            b3: true
        };
    }
}