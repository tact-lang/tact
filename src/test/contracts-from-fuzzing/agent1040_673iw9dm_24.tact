struct RemainTest {
    id: Int;
    rest: Slice as remaining;
}

contract TestContract {
    persist: RemainTest;

    init() {
        self.persist = RemainTest{
            id: 123,
            rest: emptyCell().asSlice()
        };
    }
}