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

message SendCellToAddress {
    address: Address;
    data: Cell;
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

    // Initiate a request to the specified address with the spcified cell as message body
    receive(msg: SendCellToAddress) {
        send(SendParameters{
                to: msg.address,
                bounce: false,
                value: ton("5"),
                body: msg.data,
                });
    }

    get fun receiverKind(): String {
        return self.receiverKind;
    }
}

// This contract does not process messages (no receiver of any kind)
contract NoReceiverTester {
    receiver: String = "unknown";

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract only processes empty messages
contract EmptyReceiverTester {
    receiver: String = "unknown";

    receive() {
        self.receiver = "empty";
    }

    external() {
        acceptMessage();
        self.receiver = "external_empty";
    }

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract only processes messages with a specific comment
contract CommentReceiverTester {
    receiver: String = "unknown";

    receive("message") {
        self.receiver = "comment";
    }
    
    external("message") {
        acceptMessage();
        self.receiver = "external_comment";
    }

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract only processes messages with strings (i.e., any comment)
contract StringReceiverTester {
    receiver: String = "unknown";

    receive(msg: String) {
        self.receiver = "fallback_string";
    }
    
    external(msg: String) {
        acceptMessage();
        self.receiver = "external_fallback_string";
    }

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract only has the binary message receiver 
contract BinaryReceiverTester {
    receiver: String = "unknown";

    receive(msg: Message) {
        self.receiver = "binary";
    }
    
    external(msg: Message) {
        acceptMessage();
        self.receiver = "external_binary";
    }

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract only has the fallback receiver 
contract SliceReceiverTester {
    receiver: String = "unknown";

    receive(msg: Slice) {
        self.receiver = "fallback";
    }
    
    // Currently, we cannot implement external fallback receivers
    // See issue https://github.com/tact-lang/tact/issues/1669

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the empty and specific comment receivers
contract EmptyAndCommentReceiverTester {
    receiver: String = "unknown";

    receive() {
        self.receiver = "empty";
    }

    receive("message") {
        self.receiver = "comment";
    }

    external() {
        acceptMessage();
        self.receiver = "external_empty";
    }

    external("message") {
        acceptMessage();
        self.receiver = "external_comment";
    }

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the empty and fallback string receivers 
contract EmptyAndStringReceiverTester {
    receiver: String = "unknown";

    receive() {
        self.receiver = "empty";
    }

    receive(msg: String) {
        self.receiver = "fallback_string";
    }
    
    external() {
        acceptMessage();
        self.receiver = "external_empty";
    }

    external(msg: String) {
        acceptMessage();
        self.receiver = "external_fallback_string";
    }

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the empty and binary message receivers 
contract EmptyAndBinaryReceiverTester {
    receiver: String = "unknown";

    receive() {
        self.receiver = "empty";
    }

    receive(msg: Message) {
        self.receiver = "binary";
    }
    
    external() {
        acceptMessage();
        self.receiver = "external_empty";
    }

    external(msg: Message) {
        acceptMessage();
        self.receiver = "external_binary";
    }

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the empty and fallback receivers 
contract EmptyAndSliceReceiverTester {
    receiver: String = "unknown";

    receive() {
        self.receiver = "empty";
    }

    receive(msg: Slice) {
        self.receiver = "fallback";
    }
    
    external() {
        acceptMessage();
        self.receiver = "external_empty";
    }

    // Currently, we cannot implement external fallback receivers
    // See issue https://github.com/tact-lang/tact/issues/1669

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the specific comment and fallback string receivers 
contract CommentAndStringReceiverTester {
    receiver: String = "unknown";

    receive("message") {
        self.receiver = "comment";
    }

    receive(msg: String) {
        self.receiver = "fallback_string";
    }
    
    external("message") {
        acceptMessage();
        self.receiver = "external_comment";
    }

    external(msg: String) {
        acceptMessage();
        self.receiver = "external_fallback_string";
    }

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the specific comment and binary message receivers 
contract CommentAndBinaryReceiverTester {
    receiver: String = "unknown";

    receive("message") {
        self.receiver = "comment";
    }

    receive(msg: Message) {
        self.receiver = "binary";
    }
    
    external("message") {
        acceptMessage();
        self.receiver = "external_comment";
    }

    external(msg: Message) {
        acceptMessage();
        self.receiver = "external_binary";
    }

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the specific comment and fallback receivers 
contract CommentAndSliceReceiverTester {
    receiver: String = "unknown";

    receive("message") {
        self.receiver = "comment";
    }

    receive(msg: Slice) {
        self.receiver = "fallback";
    }

    external("message") {
        acceptMessage();
        self.receiver = "external_comment";
    }

    // Currently, we cannot implement external fallback receivers
    // See issue https://github.com/tact-lang/tact/issues/1669
    
    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the fallback string and binary message receivers 
contract StringAndBinaryReceiverTester {
    receiver: String = "unknown";

    receive(msg: String) {
        self.receiver = "fallback_string";
    }
    
    receive(msg: Message) {
        self.receiver = "binary";
    }
    
    external(msg: String) {
        acceptMessage();
        self.receiver = "external_fallback_string";
    }
    
    external(msg: Message) {
        acceptMessage();
        self.receiver = "external_binary";
    }

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the fallback string and fallback receivers 
contract StringAndSliceReceiverTester {
    receiver: String = "unknown";

    receive(msg: String) {
        self.receiver = "fallback_string";
    }
    
    receive(msg: Slice) {
        self.receiver = "fallback";
    }
    
    external(msg: String) {
        acceptMessage();
        self.receiver = "external_fallback_string";
    }

    // Currently, we cannot implement external fallback receivers
    // See issue https://github.com/tact-lang/tact/issues/1669

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the binary message and fallback receivers 
contract BinaryAndSliceReceiverTester {
    receiver: String = "unknown";
    
    receive(msg: Message) {
        self.receiver = "binary";
    }
    
    receive(msg: Slice) {
        self.receiver = "fallback";
    }

    external(msg: Message) {
        acceptMessage();
        self.receiver = "external_binary";
    }

    // Currently, we cannot implement external fallback receivers
    // See issue https://github.com/tact-lang/tact/issues/1669

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the empty, specific comment and fallback string receivers 
contract EmptyAndCommentAndStringReceiverTester {
    receiver: String = "unknown";

    receive() {
        self.receiver = "empty";
    }

    receive("message") {
        self.receiver = "comment";
    }

    receive(msg: String) {
        self.receiver = "fallback_string";
    }

    external() {
        acceptMessage();
        self.receiver = "external_empty";
    }

    external("message") {
        acceptMessage();
        self.receiver = "external_comment";
    }

    external(msg: String) {
        acceptMessage();
        self.receiver = "external_fallback_string";
    }

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the empty, specific comment and binary string receivers 
contract EmptyAndCommentAndBinaryReceiverTester {
    receiver: String = "unknown";

    receive() {
        self.receiver = "empty";
    }

    receive("message") {
        self.receiver = "comment";
    }

    receive(msg: Message) {
        self.receiver = "binary";
    }

    external() {
        acceptMessage();
        self.receiver = "external_empty";
    }

    external("message") {
        acceptMessage();
        self.receiver = "external_comment";
    }

    external(msg: Message) {
        acceptMessage();
        self.receiver = "external_binary";
    }

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the empty, specific comment and fallback receivers 
contract EmptyAndCommentAndSliceReceiverTester {
    receiver: String = "unknown";

    receive() {
        self.receiver = "empty";
    }

    receive("message") {
        self.receiver = "comment";
    }

    receive(msg: Slice) {
        self.receiver = "fallback";
    }

    external() {
        acceptMessage();
        self.receiver = "external_empty";
    }

    external("message") {
        acceptMessage();
        self.receiver = "external_comment";
    }

    // Currently, we cannot implement external fallback receivers
    // See issue https://github.com/tact-lang/tact/issues/1669

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the empty, fallback string and binary receivers 
contract EmptyAndStringAndBinaryReceiverTester {
    receiver: String = "unknown";

    receive() {
        self.receiver = "empty";
    }

    receive(msg: String) {
        self.receiver = "fallback_string";
    }

    receive(msg: Message) {
        self.receiver = "binary";
    }
    
    external() {
        acceptMessage();
        self.receiver = "external_empty";
    }

    external(msg: String) {
        acceptMessage();
        self.receiver = "external_fallback_string";
    }

    external(msg: Message) {
        acceptMessage();
        self.receiver = "external_binary";
    }

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the empty, fallback string and fallback receivers 
contract EmptyAndStringAndSliceReceiverTester {
    receiver: String = "unknown";

    receive() {
        self.receiver = "empty";
    }

    receive(msg: String) {
        self.receiver = "fallback_string";
    }

    receive(msg: Slice) {
        self.receiver = "fallback";
    }

    external() {
        acceptMessage();
        self.receiver = "external_empty";
    }

    external(msg: String) {
        acceptMessage();
        self.receiver = "external_fallback_string";
    }
    
    // Currently, we cannot implement external fallback receivers
    // See issue https://github.com/tact-lang/tact/issues/1669

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the empty, binary and fallback receivers
contract EmptyAndBinaryAndSliceReceiverTester {
    receiver: String = "unknown";

    receive() {
        self.receiver = "empty";
    }

    receive(msg: Message) {
        self.receiver = "binary";
    }

    receive(msg: Slice) {
        self.receiver = "fallback";
    }
    
    external() {
        acceptMessage();
        self.receiver = "external_empty";
    }

    external(msg: Message) {
        acceptMessage();
        self.receiver = "external_binary";
    }

    // Currently, we cannot implement external fallback receivers
    // See issue https://github.com/tact-lang/tact/issues/1669

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the specific comment, string and binary receivers
contract CommentAndStringAndBinaryReceiverTester {
    receiver: String = "unknown";

    receive("message") {
        self.receiver = "comment";
    }

    receive(msg: String) {
        self.receiver = "fallback_string";
    }

    receive(msg: Message) {
        self.receiver = "binary";
    }

    external("message") {
        acceptMessage();
        self.receiver = "external_comment";
    }

    external(msg: String) {
        acceptMessage();
        self.receiver = "external_fallback_string";
    }

    external(msg: Message) {
        acceptMessage();
        self.receiver = "external_binary";
    }

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the specific comment, string and fallback receivers
contract CommentAndStringAndSliceReceiverTester {
    receiver: String = "unknown";

    receive("message") {
        self.receiver = "comment";
    }

    receive(msg: String) {
        self.receiver = "fallback_string";
    }

    receive(msg: Slice) {
        self.receiver = "fallback";
    }

    external("message") {
        acceptMessage();
        self.receiver = "external_comment";
    }

    external(msg: String) {
        acceptMessage();
        self.receiver = "external_fallback_string";
    }

    // Currently, we cannot implement external fallback receivers
    // See issue https://github.com/tact-lang/tact/issues/1669

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the specific comment, string and fallback receivers
contract CommentAndBinaryAndSliceReceiverTester {
    receiver: String = "unknown";

    receive("message") {
        self.receiver = "comment";
    }

    receive(msg: Message) {
        self.receiver = "binary";
    }

    receive(msg: Slice) {
        self.receiver = "fallback";
    }

    external("message") {
        acceptMessage();
        self.receiver = "external_comment";
    }

    external(msg: Message) {
        acceptMessage();
        self.receiver = "external_binary";
    }

    // Currently, we cannot implement external fallback receivers
    // See issue https://github.com/tact-lang/tact/issues/1669

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the string, binary and fallback receivers
contract StringAndBinaryAndSliceReceiverTester {
    receiver: String = "unknown";

    receive(msg: String) {
        self.receiver = "fallback_string";
    }

    receive(msg: Message) {
        self.receiver = "binary";
    }

    receive(msg: Slice) {
        self.receiver = "fallback";
    }

    external(msg: String) {
        acceptMessage();
        self.receiver = "external_fallback_string";
    }

    external(msg: Message) {
        acceptMessage();
        self.receiver = "external_binary";
    }

    // Currently, we cannot implement external fallback receivers
    // See issue https://github.com/tact-lang/tact/issues/1669

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the empty, specific comment, fallback string, and binary receivers 
contract EmptyAndCommentAndStringAndBinaryReceiverTester {
    receiver: String = "unknown";

    receive() {
        self.receiver = "empty";
    }

    receive("message") {
        self.receiver = "comment";
    }

    receive(msg: String) {
        self.receiver = "fallback_string";
    }

    receive(msg: Message) {
        self.receiver = "binary";
    }

    external() {
        acceptMessage();
        self.receiver = "external_empty";
    }

    external("message") {
        acceptMessage();
        self.receiver = "external_comment";
    }

    external(msg: String) {
        acceptMessage();
        self.receiver = "external_fallback_string";
    }

    external(msg: Message) {
        acceptMessage();
        self.receiver = "external_binary";
    }

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the empty, specific comment, fallback string, and fallback receivers 
contract EmptyAndCommentAndStringAndSliceReceiverTester {
    receiver: String = "unknown";

    receive() {
        self.receiver = "empty";
    }

    receive("message") {
        self.receiver = "comment";
    }

    receive(msg: String) {
        self.receiver = "fallback_string";
    }
    
    receive(msg: Slice) {
        self.receiver = "fallback";
    }

    external() {
        acceptMessage();
        self.receiver = "external_empty";
    }

    external("message") {
        acceptMessage();
        self.receiver = "external_comment";
    }

    external(msg: String) {
        acceptMessage();
        self.receiver = "external_fallback_string";
    }

    // Currently, we cannot implement external fallback receivers
    // See issue https://github.com/tact-lang/tact/issues/1669

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the empty, specific comment, binary, and fallback receivers 
contract EmptyAndCommentAndBinaryAndSliceReceiverTester {
    receiver: String = "unknown";

    receive() {
        self.receiver = "empty";
    }

    receive("message") {
        self.receiver = "comment";
    }

    receive(msg: Message) {
        self.receiver = "binary";
    }
    
    receive(msg: Slice) {
        self.receiver = "fallback";
    }

    external() {
        acceptMessage();
        self.receiver = "external_empty";
    }

    external("message") {
        acceptMessage();
        self.receiver = "external_comment";
    }

    external(msg: Message) {
        acceptMessage();
        self.receiver = "external_binary";
    }

    // Currently, we cannot implement external fallback receivers
    // See issue https://github.com/tact-lang/tact/issues/1669

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the empty, string, binary and fallback receivers 
contract EmptyAndStringAndBinaryAndSliceReceiverTester {
    receiver: String = "unknown";

    receive() {
        self.receiver = "empty";
    }

    receive(msg: String) {
        self.receiver = "fallback_string";
    }

    receive(msg: Message) {
        self.receiver = "binary";
    }
    
    receive(msg: Slice) {
        self.receiver = "fallback";
    }

    external() {
        acceptMessage();
        self.receiver = "external_empty";
    }

    external(msg: String) {
        acceptMessage();
        self.receiver = "external_fallback_string";
    }

    external(msg: Message) {
        acceptMessage();
        self.receiver = "external_binary";
    }

    // Currently, we cannot implement external fallback receivers
    // See issue https://github.com/tact-lang/tact/issues/1669

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has the specific comment, string, binary and fallback receivers 
contract CommentAndStringAndBinaryAndSliceReceiverTester {
    receiver: String = "unknown";

    receive("message") {
        self.receiver = "comment";
    }

    receive(msg: String) {
        self.receiver = "fallback_string";
    }

    receive(msg: Message) {
        self.receiver = "binary";
    }
    
    receive(msg: Slice) {
        self.receiver = "fallback";
    }

    external("message") {
        acceptMessage();
        self.receiver = "external_comment";
    }

    external(msg: String) {
        acceptMessage();
        self.receiver = "external_fallback_string";
    }

    external(msg: Message) {
        acceptMessage();
        self.receiver = "external_binary";
    }

    // Currently, we cannot implement external fallback receivers
    // See issue https://github.com/tact-lang/tact/issues/1669

    get fun receiver(): String {
        return self.receiver;
    }
}

// This contract has all the receiver kinds
contract AllReceiverTester {
    receiver: String = "unknown";

    receive() {
        self.receiver = "empty";
    }

    receive("message") {
        self.receiver = "comment";
    }

    receive(msg: String) {
        self.receiver = "fallback_string";
    }

    receive(msg: Message) {
        self.receiver = "binary";
    }
    
    receive(msg: Slice) {
        self.receiver = "fallback";
    }

    external() {
        acceptMessage();
        self.receiver = "external_empty";
    }

    external("message") {
        acceptMessage();
        self.receiver = "external_comment";
    }

    external(msg: String) {
        acceptMessage();
        self.receiver = "external_fallback_string";
    }

    external(msg: Message) {
        acceptMessage();
        self.receiver = "external_binary";
    }

    // Currently, we cannot implement external fallback receivers
    // See issue https://github.com/tact-lang/tact/issues/1669

    get fun receiver(): String {
        return self.receiver;
    }
}
