message Message {
    msg: String;
}

contract ReceiverTester {

    receiverKind: String = "unknown";

    receive() {
        self.receiverKind = "empty";
    }

    receive("message") {
        self.receiverKind = "message";
    }

    receive(msg: String) {
        if (msg == "message") {
            self.receiverKind = "message_string";
        } else {
            self.receiverKind = "string";
        }
    }

    receive(msg: Message) {
        self.receiverKind = "Message_struct";
    }

    receive(msg: Slice) {
        // Drop the op code
        msg.loadUint(32); 
        let m = msg.asString();
        if (m == "message") {
            self.receiverKind = "message_slice";
        } else {
            self.receiverKind = "slice";
        }
    }

    get fun receiverKind(): String {
        return self.receiverKind;
    }
}

