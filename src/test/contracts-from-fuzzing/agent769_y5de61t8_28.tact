struct SliceStuff {
    sl: Slice;
    optSl: Slice?;
}

contract SliceTest {
    data: SliceStuff;
    init() {
        self.data = SliceStuff{
            sl: emptyCell().asSlice(),
            optSl: null
        };
    }
}