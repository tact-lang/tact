struct WithRemaining {
    a: Int;
    extra: Slice as remaining;
}

contract StorageTest {
    val: WithRemaining;

    init() {
        self.val = WithRemaining{
            a: 42,
            extra: emptyCell().asSlice()
        };
    }
}