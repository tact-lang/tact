struct S {
    intField: Int as uint8;
}

contract OutOfRangeTest {
    st: S;

    init() {
        self.st = S{ intField: 300 };
    }
}
