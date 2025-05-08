struct HasSlices {
    sl: Slice;
    optSl: Slice?;
    c: Cell;
    optC: Cell?;
}

contract SliceTest {
    val: HasSlices;
    init() {
        self.val = HasSlices{
            sl: emptyCell().asSlice(),
            optSl: null,
            c: emptyCell(),
            optC: null
        };
    }
}