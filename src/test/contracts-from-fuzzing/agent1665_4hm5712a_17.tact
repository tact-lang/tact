struct HasSlices {
    s1: Slice;
    s2: Slice?;
}

contract Test17 {
    data: HasSlices;

    init() {
        self.data = HasSlices{
            s1: emptyCell().asSlice(),
            s2: null
        };
    }
}