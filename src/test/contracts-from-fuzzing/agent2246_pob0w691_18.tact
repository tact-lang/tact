struct HasSlice {
    first: String;
    extra: Slice as remaining;
}

contract RemainingTest {
    data: HasSlice;

    init() {
        self.data = HasSlice{
            first: "foo",
            extra: emptyCell().asSlice()
        };
    }
}
