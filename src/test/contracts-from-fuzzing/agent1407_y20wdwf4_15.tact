struct Payload {
    body: Slice as remaining;
}

contract TestContract {
    data: Payload;

    init() {
        self.data = Payload{ body: emptyCell().asSlice() };
    }
}