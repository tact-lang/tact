message MsgA {
    a: Int;
}

message MsgB {
    b: Int;
}

contract MultiReceiverTest {
    // This receiver catches messages with exact comment "alpha"
    receive("alpha") {
        // Logic for alpha
    }

    // This receiver catches messages of type MsgA
    receive(msg: MsgA) {
        // Logic for MsgA
    }

    // This receiver catches messages with String body (if not matched by others)
    receive(str: String) {
        // Logic for String messages
    }

    // Fallback receiver catches any message not captured by previous ones
    receive(msg: Slice) {
        // Fallback handling
    }
}
