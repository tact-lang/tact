struct Payload {
    slice: Slice as remaining;
}

struct Nested {
    payload: Payload;
}

contract TestContract {
    nestedOpt: Nested?;

    init() {
        self.nestedOpt = null;
    }
}