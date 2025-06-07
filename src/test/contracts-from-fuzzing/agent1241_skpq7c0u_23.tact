struct RemainData {
    a: Int;
    more: Slice as remaining;
}

contract RemainFieldTest {
    payload: RemainData;

    init() {
        self.payload = RemainData{
            a: 42,
            more: emptyCell().asSlice(),
        };
    }
}
