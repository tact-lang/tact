struct Payload {
    meta: Int;
    tail: Slice as remaining;
}

struct Container {
    id: Int;
    data: Payload;
}

contract RemainingNestedTest {
    cont: Container;

    init() {
        self.cont = Container{
            id: 1,
            data: Payload{
                meta: 42,
                tail: emptyCell().asSlice()
            }
        };
    }

    receive() {}
}