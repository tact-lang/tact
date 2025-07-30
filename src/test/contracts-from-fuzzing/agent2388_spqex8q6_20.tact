struct RemainderStruct {
    a: Int;
    data: Slice as remaining;
}

contract RemainingTest {
    payload: RemainderStruct;

    init() {
        self.payload = RemainderStruct{
            a: 100,
            data: beginCell().storeUint(123, 32).endCell().asSlice()
        };
    }
}