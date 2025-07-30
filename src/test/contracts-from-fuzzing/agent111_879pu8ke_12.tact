struct HasTail {
    header: Int;
    body: Slice as remaining;
}

contract TestContract {
    data: HasTail;

    init() {
        self.data = HasTail{
            header: 123,
            body: emptyCell().asSlice()
        };
    }
}
