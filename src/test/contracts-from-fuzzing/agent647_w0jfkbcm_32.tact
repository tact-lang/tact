// struct with remaining slice with explicit serialization
struct Remain {
    data: Int as uint8;
    rem: Slice as remaining;
}

contract TestContract {
    d: Remain;

    init() {
        let cell = beginCell().storeUint(17,8).endCell();
        self.d = Remain{
            data: 17,
            rem: cell.asSlice()
        };
    }
}