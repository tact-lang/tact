struct BoolIntStruct {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    i1: Int;
    i2: Int;
}

contract StorageTest {
    state: BoolIntStruct;

    init() {
        self.state = BoolIntStruct{
            b1: true,
            b2: false,
            b3: true,
            i1: 123,
            i2: 456
        };
    }
}
