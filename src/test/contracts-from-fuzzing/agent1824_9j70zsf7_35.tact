// Struct using 'remaining' slice serialization
struct RemTest {
    fixed: Int;
    suffix: Slice as remaining;
}

contract RemainingStructContract {
    data: RemTest;

    init() {
        self.data = RemTest{
            fixed: 42,
            suffix: emptyCell().asSlice()
        };
    }
}
