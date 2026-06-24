// check if optional Cell field as persistent storage works
contract OptionalCellTest {
    c: Cell?;
    init() {
        self.c = null;
    }
}
