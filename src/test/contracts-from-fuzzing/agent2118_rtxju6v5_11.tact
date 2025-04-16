struct RemainField {
    data: Int;
    rest: Slice as remaining;
}

contract RemainTest {
    st: RemainField;

    init() {
        self.st = RemainField{
            data: 42,
            rest: emptyCell().asSlice(),
        };
    }
}