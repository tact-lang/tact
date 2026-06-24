struct SZero {
    zero: Int as uint4;
}

contract ZeroAssignTest {
    value: SZero;

    init() {
        self.value = SZero{ zero: 0 };
    }
}