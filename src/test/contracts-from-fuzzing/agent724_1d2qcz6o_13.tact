struct Payload {
    amount: Int as coins;
    comment: Slice as remaining;
}

contract TestContract {
    payload: Payload;

    init() {
        self.payload = Payload{
            amount: 1000000,
            comment: "hi".asComment().asSlice()
        };
    }
}