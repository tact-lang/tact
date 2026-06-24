message(100) MyMessage {
    foo: Int;
    bar: Bool;
}

contract MessageFieldTest {
    msgField: MyMessage;

    init() {
        self.msgField = MyMessage{
            foo: 123,
            bar: true
        };
    }
}