message(0x1) MyMessage {
    foo: Int;
    bar: Bool?;
}

contract TestContract {
    data: MyMessage;

    init() {
        self.data = MyMessage{
            foo: 123,
            bar: null,
        };
    }

    receive() {}
}