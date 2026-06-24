struct RemainingStruct {
    height: Int;
    body: Slice as remaining;
}

contract RemainingAfterInt {
    x: RemainingStruct;

    init() {
        self.x = RemainingStruct{
            height: 123,
            body: beginCell().storeUint(42, 6).endCell().asSlice()
        };
    }
}
