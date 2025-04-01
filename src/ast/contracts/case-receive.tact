message MyMessage {
    value: Int;
}

contract ReceiveTestContract {
    a: Int;

    init() {
        self.a = 0;
    }

    receive() {
        self.a = 1;
    }

    receive("message") {
        self.a = 2;
    }

    receive(m: MyMessage) {
        self.a = m.value;
    }

    bounced(m: bounced<MyMessage>) {
        self.a = 3;
    }

    external() {
        self.a = 4;
        acceptMessage();
    }

    external("message") {
        self.a = 5;
        acceptMessage();
    }

    external(m: MyMessage) {
        self.a = m.value;
        acceptMessage();
    }
}