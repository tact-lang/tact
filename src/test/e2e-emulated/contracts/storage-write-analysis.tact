contract Tester {

    init() {
        // if storage write analysis is implemented correctly, this will send
        // just one message back to self, otherwise it will spam with messages
        // until it runs out of gas
        message(MessageParameters { to: myAddress(), value: 0, mode: SendRemainingValue })
    }

    receive() { } // does not modify the contract state
}
