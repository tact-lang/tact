struct HasSlice {
    s: Slice;
    num: Int;
}

contract TestContract {
    hs: HasSlice;

    init() {
        self.hs = HasSlice{ s: "hello".asComment().asSlice(), num: 42 };
    }
}