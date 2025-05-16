struct Remain {
    foo: Int;
    rest: Slice as remaining;
}

contract RemainingTest {
    data: Remain;

    init() {
        self.data = Remain{
            foo: 5,
            rest: emptyCell().asSlice(),
        };
    }
}