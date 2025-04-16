struct RemainTest {
    main: Int as uint32;
    rem: Slice as remaining;
}

contract RemainingFieldTest {
    data: RemainTest;
    init() {
        self.data = RemainTest{
            main: 11,
            rem: emptyCell().asSlice()
        };
    }
}