struct CarryRemaining {
    a: Int;
    remain: Slice as remaining;
}

contract RemainingTest {
    data: CarryRemaining;

    init() {
        self.data = CarryRemaining{
            a: 42,
            remain: beginCell().storeUint(0, 1).endCell().asSlice()
        };
    }
}
