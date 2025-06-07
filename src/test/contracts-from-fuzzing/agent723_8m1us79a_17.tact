struct DataTail {
    prefix: Int as uint32;
    payload: Slice as remaining;
}

contract TestContract {
    tail: DataTail;

    init() {
        self.tail = DataTail{
            prefix: 123,
            payload: emptyCell().asSlice(),
        };
    }

    receive() {}
}