message Ping {
    value: Int;
}

contract FailReceiver {
    receive() {
        // Always trigger failure to cause bounce
        require(false, "Intentional failure to trigger bounce");
    }
}

contract ChainBounce2 {
    // Bounce receiver for handling bounced Ping messages
    bounced(msg: bounced<Ping>) {
        // Minimal implementation for bounce handling
    }

    // Regular receiver that sends a Ping message to a failing contract
    receive() {
        send(SendParameters{
            to: address("0:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"),
            value: ton("1"),
            bounce: true,
            mode: 0,
            body: Ping{ value: 123 }.toCell()
        });
    }
}
