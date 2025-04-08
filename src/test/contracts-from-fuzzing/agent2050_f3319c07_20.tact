struct RemainderTest {
    val: Int;
    rem: Cell as remaining;
}

contract RemainCellTest {
    data: RemainderTest;

    init() {
        self.data = RemainderTest{
            val: 77,
            rem: emptyCell()
        };
    }
}