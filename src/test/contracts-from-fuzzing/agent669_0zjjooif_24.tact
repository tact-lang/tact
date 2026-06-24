struct RemainingStruct {
    prefix: Int as uint32;
    rest: Slice as remaining;
}

contract RemainingFieldHolder {
    val: RemainingStruct;

    init() {
        self.val = RemainingStruct{
            prefix: 42,
            rest: beginCell().storeUint(1,4).endCell().asSlice()
        };
    }
}