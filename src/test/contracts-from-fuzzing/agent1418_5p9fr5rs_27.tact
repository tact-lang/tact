struct TestRem {
    rest: Slice as remaining;
}

contract RemainingFieldTest {
    data: TestRem;

    init() {
        self.data = TestRem{ rest: emptyCell().asSlice() };
    }
}