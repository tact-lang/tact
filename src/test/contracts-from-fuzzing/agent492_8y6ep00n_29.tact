struct Message {
    content: String?;
    urgent: Bool;
}

contract Foo {
    m: Message?;
    num: Int;

    init() {
        self.m = null;
        self.num = 0;
    }

    receive() {
        self.m = Message{content: null, urgent: true};
        self.num = 10;
    }
}