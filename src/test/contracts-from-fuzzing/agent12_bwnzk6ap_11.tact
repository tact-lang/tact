message BMsg {
    flag: Bool;
}

contract BounceResponder {
    // This contract always forces a bounce by reverting in the receive function
    receive() {
        require(false, "Forced bounce from BounceResponder");
    }
}

contract BounceInitiator {
    bounced(msg: bounced<BMsg>) {
        // On receiving a bounced message, send a new bounce message with inverted flag
        send(SendParameters{
            to: address("0:bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"),
            value: 0,
            bounce: true,
            mode: SendRemainingValue,
            body: BMsg{ flag: !msg.flag }.toCell()
        });
    }
    
    receive() {
        // Initially, send a bounce message to BounceResponder
        send(SendParameters{
            to: address("0:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
            value: 0,
            bounce: true,
            mode: SendRemainingValue,
            body: BMsg{ flag: true }.toCell()
        });
    }
}
