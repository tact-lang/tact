struct Inner {
    flag: Bool;
    addr: Address;
    text: String;
    code: Cell;
    data: Slice;
}

contract MultiType {
    state: Inner;

    init() {
        self.state = Inner{
            flag: true,
            addr: myAddress(),
            text: "hello",
            code: myCode(),
            data: myCode().asSlice(),
        };
    }
}