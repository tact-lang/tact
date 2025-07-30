struct ContainsSlice {
    sl: Slice;
}

contract SliceFieldTest {
    content: ContainsSlice;

    init() {
        self.content = ContainsSlice{
            sl: emptyCell().asSlice(),
        };
    }
}