struct WithSlice {
    data: Slice;
    flag: Bool;
}

contract StructWithSlice {
    x: WithSlice;

    init() {
        self.x = WithSlice{
            data: emptyCell().asSlice(),
            flag: true,
        };
    }
}