struct HasRemaining {
    fixed: Int as uint8;
    rem: Cell as remaining;
}

contract RemainingFieldTest {
    data: HasRemaining;

    init() {
        self.data = HasRemaining{
            fixed: 7,
            rem: emptyCell(),
        };
    }
}
