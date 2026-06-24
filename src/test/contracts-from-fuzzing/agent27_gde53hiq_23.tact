struct Payload {
    flag: Bool;
    data: Slice as remaining;
}

contract TestContract {
    p: Payload;

    init() {
        self.p = Payload{
            flag: true,
            data: "hello".asSlice()
        };
    }
}