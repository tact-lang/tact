struct MultiLayer {
    l1: Int;
    l2: String;
    l3: Bool;
    l4: Slice;
}

contract MultiTypeLayers {
    m: MultiLayer;

    init() {
        self.m = MultiLayer { l1:42, l2:"abc", l3:true, l4:emptyCell().asSlice() };
    }
}
