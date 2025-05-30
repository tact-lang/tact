struct RemainingSliceHolder {
    prefix: Int as uint8;
    rest: Slice as remaining;
}

contract SliceStructStorage {
    data: RemainingSliceHolder;
    init() {
        self.data = RemainingSliceHolder{
            prefix: 7,
            rest: beginCell().storeUint(12345, 16).endCell().asSlice()
        };
    }
}