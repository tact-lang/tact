struct HasSlice {
    s: Slice;
    rem: Slice as remaining;
}

contract Foo {
    data: HasSlice;

    init() {
        let cell = beginCell().storeInt(0, 8).endCell();
        self.data = HasSlice{
            s: cell.asSlice(),
            rem: cell.asSlice()
        };
    }
}