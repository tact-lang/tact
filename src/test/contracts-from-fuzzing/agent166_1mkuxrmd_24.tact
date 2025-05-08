struct LastData {
    first: Int;
    tail: Slice as remaining;
}

struct Wrapper {
    data: LastData;
}

contract TestContract {
    state: Wrapper;

    init() {
        self.state = Wrapper{
            data: LastData {
                first: 42,
                tail: emptyCell().asSlice(),
            },
        };
    }
}