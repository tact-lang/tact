message(0xABCDEF01) MyMessage {
    foo: Int;
    bar: String;
}

contract TestContract {
    m: MyMessage;

    init() {
        self.m = MyMessage{
            foo: 1,
            bar: "test"
        };
    }
}