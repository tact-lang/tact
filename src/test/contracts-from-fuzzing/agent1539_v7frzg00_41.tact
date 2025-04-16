struct StringAndSlice {
    a: String;
    b: Slice;
}

contract StructMix {
    s: StringAndSlice;
    init() {
        self.s = StringAndSlice{a: "hello", b: emptyCell().asSlice()};
    }
}