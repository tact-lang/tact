contract DebugCellTest {
    receive() {
        dump(emptyCell());
        dump(beginCell());
        dump(emptySlice());
    }
}
