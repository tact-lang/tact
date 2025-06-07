struct RemainingExample {
    prefix: Int as uint32;
    data: Slice as remaining;
}

contract TestContract {
    payload: RemainingExample;

    init() {
        self.payload = RemainingExample{
            prefix: 123,
            data: emptyCell().asSlice(),
        };
    }
}