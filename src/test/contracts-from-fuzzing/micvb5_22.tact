contract Caller {
    // An internal function that will be called from the receiver
    fun helper(): Int {
        dump("helper() called");
        return 10;
    }

    // A receiver function which is automatically invoked when a message with text "call" is received
    receive("call") {
        dump("receiver 'call' triggered");
        let res: Int = self.helper();
        let sb: StringBuilder = beginString();
        sb.append("helper() returned: ");
        sb.append(res.toString());
        dump(sb.toString());
    }
}

// Note:
// In Tact, you don't explicitly call functions from the global scope.
// Instead, functions like helper() are invoked automatically as part of contract execution (for instance, when a message triggers the receiver).

// This snippet defines contract Caller with a receiver function. When a message with opcode "call" is sent,
// the TVM will automatically invoke the receiver, which then calls helper().
