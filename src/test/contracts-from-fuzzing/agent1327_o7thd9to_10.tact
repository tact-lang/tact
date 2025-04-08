struct Payload {
    data: Int as uint32;
    tail: Slice as remaining;
}

struct Container {
    payload: Payload;
}

contract Test {
    info: Container;

    init() {
        self.info = Container{
            payload: Payload{
                data: 42,
                tail: emptyCell().asSlice()
            }
        };
    }
}