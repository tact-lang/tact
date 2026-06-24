struct Payload {
    id: Int as uint32;
    tail: Slice as remaining;
}

contract TestContract {
    p: Payload;

    init() {
        self.p = Payload{
            id: 123,
            tail: "hello".asComment().asSlice()
        };
    }
}