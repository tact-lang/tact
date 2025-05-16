struct NestedSlice {
    id: Int;
    rest: Slice as remaining;
}

contract RemainAsField {
    s: NestedSlice;

    init() {
        self.s = NestedSlice{
            id: 55,
            rest: "abc".asComment().asSlice(),
        };
    }
}