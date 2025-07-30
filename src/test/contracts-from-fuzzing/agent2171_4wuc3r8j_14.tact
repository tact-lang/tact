struct HasSlice {
    s: Slice;
    opt: Slice?;
}

contract SliceStructStorage {
    val: HasSlice;

    init() {
        self.val = HasSlice{
            s: emptyCell().asSlice(),
            opt: null
        };
    }
}