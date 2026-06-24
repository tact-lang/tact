struct RemainingSlice {
    payload: Slice as remaining;
}

contract RemainingTest {
    data: RemainingSlice;

    init() {
        self.data = RemainingSlice{payload: "test".asComment().asSlice()};
    }
}
