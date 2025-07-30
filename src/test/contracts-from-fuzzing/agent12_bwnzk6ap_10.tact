message ShortMsg {
    flag: Bool;
}

contract BounceSender {
    bounced(msg: bounced<ShortMsg>) {
        // Bounce receiver that accesses the bounced message field safely
        if (msg.flag) {
            // do nothing
        }
    }
    
    receive() {
        send(SendParameters{
            to: address("0:FAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"),
            value: 0,
            bounce: true,
            mode: SendRemainingValue,
            body: ShortMsg{ flag: true }.toCell()
        });
    }
}
