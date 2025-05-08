struct Payload {
    value: Int;
    extra: Slice as remaining;
}

struct Container {
    id: Int;
    payload: Payload;
}

contract TestContract {
    c: Container;

    init() {
        self.c = Container{
            id: 1,
            payload: Payload{
                value: 2,
                extra: "hello".asSlice()
            }
        };
    }
}