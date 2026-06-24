struct HasSlices {
    s1: Slice;
    s2: Slice?;
}

contract PersistSlices {
    val: HasSlices;

    init() {
        self.val = HasSlices{s1: emptyCell().asSlice(), s2: null};
    }
}