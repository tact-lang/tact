message MsgA {
    a: Int;
}

message MsgB {
    b: Int;
}

contract BounceMismatch {
    // Bounce receiver expects a bounced message of type MsgA
    bounced(msg: bounced<MsgA>) {
        // In case a message of type MsgB bounces, this receiver should not be triggered.
        // For testing, we simply do nothing.
    }

    receive() {
         // Send a message with body MsgB, so it doesn't match the expected type in bounce()
         send(SendParameters{
            to: address("0:0000000000000000000000000000000000000000000000000000000000000000"),
            value: ton("1"),
            bounce: true,
            mode: 0,
            body: MsgB { b: 10 }.toCell()
         });
    }
}
