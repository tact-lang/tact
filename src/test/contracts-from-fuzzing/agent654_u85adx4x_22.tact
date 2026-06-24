// Test serialization with remaining field in struct
struct Payload {
    header: Int as uint32;
    body: Slice as remaining;
}

contract TestContract {
    payload: Payload;

    init() {
        self.payload = Payload{
            header: 42,
            body: emptyCell().asSlice(),
        };
    }
}