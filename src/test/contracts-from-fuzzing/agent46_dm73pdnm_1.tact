message MyMsg {
    value: Int;
}

contract BounceTester {
    bounced(msg: bounced<MyMsg>) {
        // Bounce receiver: handling bounced messages of type MyMsg
    }

    // A dummy receive to satisfy contract requirements
    receive() {
        // Empty receive function
    }
}
