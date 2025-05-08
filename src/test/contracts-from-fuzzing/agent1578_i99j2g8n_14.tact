struct HasSlice {
    s1: Slice;
    s2: Slice;
}

contract TestContract {
    val: HasSlice;

    init() {
        let c = emptyCell();
        let s = c.asSlice();
        self.val = HasSlice{ s1: s, s2: s };
    }
}