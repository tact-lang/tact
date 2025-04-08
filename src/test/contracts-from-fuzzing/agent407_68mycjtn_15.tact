struct RemField {
    fixed: Int;
    varint: Int as coins;
    rest: Slice as remaining;
}

contract SerialEnd {
    data: RemField;
    init() {
        self.data = RemField{
            fixed: 42,
            varint: 1000,
            rest: emptyCell().asSlice()
        };
    }
}
