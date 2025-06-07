struct WithSlice {
    s: Slice;
}

contract SliceFieldTest {
    data: WithSlice;

    init() {
        self.data = WithSlice{
            s: emptyCell().asSlice(),
        };
    }
}