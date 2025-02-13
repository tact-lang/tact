message Message {
    msg: String;
}

message BinaryIntOperation {
    op: String;
    val1: Int;
    val2: Int;
}

message BinaryIntResult {
    val: Int;
}

// This contract receives binary arithmetic requests.
// It only supports divisions.
contract Calculator {

    receive("deploy") {}

    receive(request: BinaryIntOperation) {
        require(request.op == "/", "Only divisions are currently supported.");
        let result = request.val1 / request.val2;
        send(SendParameters{
            to: sender(),
            bounce: false,
            value: ton("1"),
            body: BinaryIntResult{val: result}.toCell(), 
            });
    }
}

contract ReceiverTester {

    receiverKind: String = "unknown";

    receive() {
        self.receiverKind = "empty";
    }

    receive(msg: String) {
        if (msg == "message") {
            self.receiverKind = "error_comment";
        } else {
            self.receiverKind = "comment_fallback";
        }
    }

    receive(msg: Message) {
        self.receiverKind = "binary_message";
    }

    receive(msg: Slice) {
        // Drop the op code
        msg.loadUint(32); 
        let m = msg.asString();
        if (m == "message") {
            self.receiverKind = "message_slice";
        } else {
            self.receiverKind = "fallback";
        }
    }

    receive("message") {
        self.receiverKind = "comment";
    }

    // Bounced testing

    // Initiate a request to the calculator, with an unsupported arithmetic operation: 1 + 1
    receive("do_unsupported_op") {
        let addr = contractAddress(initOf Calculator());
        send(SendParameters{
                to: addr,
                bounce: true,
                value: ton("1"),
                body: BinaryIntOperation{op: "+", val1: 1, val2: 1}.toCell(),
                });
    }

    // Initiate a request to the calculator, with a division by zero: 10/0
    receive("do_div_by_zero") {
        let addr = contractAddress(initOf Calculator());
        send(SendParameters{
                to: addr,
                bounce: true,
                value: ton("1"),
                body: BinaryIntOperation{op: "/", val1: 10, val2: 0}.toCell(),
                });
    }

    // Initiate a request to the calculator: 10/2
    receive("do_success_div") {
        let addr = contractAddress(initOf Calculator());
        send(SendParameters{
                to: addr,
                bounce: true,
                value: ton("1"),
                body: BinaryIntOperation{op: "/", val1: 10, val2: 2}.toCell(),
                });
    }

    // Initiate a non-arithmetic request to the calculator.
    // The calculator will reject the request
    receive("do_unknown_request") {
        let addr = contractAddress(initOf Calculator());
        send(SendParameters{
                to: addr,
                bounce: true,
                value: ton("1"),
                body: "do_something".asComment(),
                });
    }

    bounced(msg: Slice) {
        self.receiverKind = "bounced_fallback";
    }

    bounced(msg: bounced<BinaryIntOperation>) {
        self.receiverKind = "bounced_binary_message";
    }

    // External receiver testing

    external(msg: String) {
        acceptMessage();
        if (msg == "message") {
            self.receiverKind = "external_error_comment";
        } else {
            self.receiverKind = "external_comment_fallback";
        }
    }
    
    external() {
        acceptMessage();
        self.receiverKind = "external_empty";
    }

    external("message") {
        acceptMessage();
        self.receiverKind = "external_comment";
    }

    external(msg: Message) {
        acceptMessage();
        self.receiverKind = "external_binary_message";
    }

    get fun receiverKind(): String {
        return self.receiverKind;
    }
}

